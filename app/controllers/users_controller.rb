class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @projects = Project.where('(track_user_id = ?) OR (lyric_user_id =?) OR (singer_user_id = ?) OR (video_user_id = ?)', current_user.id, current_user.id, current_user.id, current_user.id)
  end

  def edit
  end
end
