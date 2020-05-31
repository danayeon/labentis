class MatchesController < ApplicationController
  def new
    @match = Match.includes(:project).new
    @project = Project.includes(:user).find(params[:project_id])
  end

  def create
    Match.create(create_params)
    redirect_to root_path
  end

  def edit
    @match = Match.find(params[:id])
    @project = Project.find(@match.project_id)
  end

  def update
    @match = Match.find(params[:id])
    @project = Project.find(@match.project_id)
    @project.update(track_user_id: @match.user_id) if params[:match][:track] == "1"
    @project.update(lyric_user_id: @match.user_id) if params[:match][:lyric] == "1"
    @project.update(singer_user_id: @match.user_id) if params[:match][:singer] == "1"
    @project.update(video_user_id: @match.user_id) if params[:match][:video] == "1"
    if params[:match][:track] or params[:match][:lyric] or params[:match][:singer] or params[:match][:video]
      @match.update(permission: 1)
    else
      @match.update(premission: 0)
    end
    redirect_to project_path(@project.id)
  end

  private
  def new_params
    params.require(:match).permit(:project_id)
  end

  def create_params
    params.require(:match).permit(:track, :lyric, :singer, :video, :comment, :project_id, :user_id)
  end
end
