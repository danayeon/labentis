class ProjectsController < ApplicationController

  def index
    @projects = Project.includes(:user).all
  end

  def show
    @project = Project.includes(:user).find(params[:id])
    @track_user = User.find(@project.track_user_id)
    @lyric_user = User.find(@project.lyric_user_id)
    @singer_user = User.find(@project.singer_user_id)
    @video_user = User.find(@project.video_user_id)
  end

  def new
    @project = Project.includes(:user).new
  end

  def create
    Project.create!(project_params)
    redirect_to root_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :statement)
  end
end
