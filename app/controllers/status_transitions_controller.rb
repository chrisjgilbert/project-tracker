class StatusTransitionsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])

    @project.with_lock do
      @status_transition = @project.status_transitions.create!(status_transition_params)
      @project.update!(status: @status_transition.to)
    end

    respond_to do |format|
      format.html { redirect_to @project }
    end
  end

  def status_transition_params
    params.require(:status_transition).permit(:to).merge(from: @project.status)
  end
end
