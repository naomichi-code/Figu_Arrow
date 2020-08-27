class Public::GroupChatsController < ApplicationController
  before_action :authenticate_user!
  def create
    @chat = current_user.group_chats.new(chat_params)
    @chat.save
    @chats = GroupChat.all
  end

  private
  def chat_params
      params.require(:group_chat).permit(:message, :group_id)
  end

end