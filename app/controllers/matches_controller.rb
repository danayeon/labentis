class MatchesController < ApplicationController
  def new
    @match = Match.includes(:project).new
    @project = Project.includes(:user).find(params[:project_id])
  end

  def create
    Match.create(create_params)
    redirect_to root_path
  end

  private
  def new_params
    params.require(:match).permit(:project_id)
  end

  def create_params
    params.require(:match).permit(:track, :lyric, :singer, :video, :comment, :project_id, :user_id)
  end
end
