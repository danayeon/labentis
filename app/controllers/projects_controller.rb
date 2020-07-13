class ProjectsController < ApplicationController

  def index
    @projects = Project.includes(:user).all
  end

  def show
    @project = Project.includes(:user).find(params[:id])
    @manage_user = User.find(@project.manage_user_id) if @project.manage_user_id
    @track_user = User.find(@project.track_user_id) if @project.track_user_id
    @lyric_user = User.find(@project.lyric_user_id) if @project.lyric_user_id
    @singer_user = User.find(@project.singer_user_id) if @project.singer_user_id
    @video_user = User.find(@project.video_user_id) if @project.video_user_id

    @matches = Match.where(project_id: params[:id])

    @messages = Message.where(project_id: @project.id)
  end

  def new
    @project = Project.includes(:user).new
  end

  def create
    @project = Project.create(project_params)
    @project.update(track_user_id: current_user.id) if params[:project][:track_user_id] == "1"
    @project.update(lyric_user_id: current_user.id) if params[:project][:lyric_user_id] == "1"
    @project.update(singer_user_id: current_user.id) if params[:project][:singer_user_id] == "1"
    @project.update(video_user_id: current_user.id) if params[:project][:video_user_id] == "1"
    @project.update(manage_user_id: current_user.id)
    redirect_to project_path(@project.id)
  end

  private
  def project_params
    params.require(:project).permit(:title, :statement)
  end
end
