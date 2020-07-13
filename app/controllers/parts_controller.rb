class PartsController < ApplicationController
  def index
    @part = Part.new
    @project = Project.find(params[:project_id])
    @parts = Part.where(project_id: params[:project_id])
  end

  def create
    @part = Part.new(create_part_params)
    @part.update(project_id: params[:project_id])

    redirect_to project_parts_path(params[:project_id])
  end

  private
  def create_part_params
    params.require(:part).permit(:file).merge(user_id: current_user.id)
  end
end
