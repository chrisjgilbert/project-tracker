class StatusTransitionsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @status_transition = @project.update_status!(status_transition_params[:to])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.prepend(:events, partial: "projects/status_transition", locals: {event: @status_transition.event})
        ]
      end
      format.html { redirect_to @project }
    end
  end

  def status_transition_params
    params.require(:status_transition).permit(:to)
  end
end
