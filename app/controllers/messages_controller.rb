class MessagesController < ApplicationController
  def index
    @message = Message.new
    @project = Project.find(params[:project_id])
    @messages = Message.where(project_id: params[:project_id])
  end

  def create
    @message = Message.new(create_message_params)
    @message.update(project_id: params[:project_id])

    redirect_to project_messages_path(params[:project_id])
  end

  private
  def create_message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
