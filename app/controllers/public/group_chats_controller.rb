class Public::GroupChatsController < ApplicationController
  before_action :authenticate_user!
  def create
    @chat = current_user.group_chats.new(chat_params)
    @chat.save
    @group = Group.find(@chat.group_id)
    @chats = @group.group_chats
  end
  def destroy
    @chat = GroupChat.find(params[:id])
    @group = Group.find(@chat.group_id)
    @chat.destroy
    @chats = @group.group_chats
  end

  private
  def chat_params
      params.require(:group_chat).permit(:message, :group_id)
  end

end