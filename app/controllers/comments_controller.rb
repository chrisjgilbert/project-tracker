class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create(comment_params)

    respond_to do |format|
      if @comment.persisted?
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend(:events, partial: "projects/comment", locals: {event: @comment.event}),
            turbo_stream.replace(:new_comment_form, partial: "form", locals: {project: @project, comment: @project.comments.build})
          ]
        end
        format.html { redirect_to @project }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:new_comment_form, partial: "form", locals: {project: @project, comment: @comment})
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
