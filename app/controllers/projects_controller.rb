class ProjectsController < ApplicationController

  def index
    @projects = Project.includes(:team).all
  end

  def show
    @project = Project.includes(:team).find(params[:id])
    @track_user = User.find(@project.team.track_user_id)
    @lyric_user = User.find(@project.team.lyric_user_id)
    @singer_user = User.find(@project.team.singer_user_id)
    @video_user = User.find(@project.team.video_user_id)
  end
end
