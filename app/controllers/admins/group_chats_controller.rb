class Admins::GroupChatsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    chat = GroupChat.find(params[:id])
    group = chat.group_id
    chat.destroy
    redirect_to admins_group_path(group)
  end
end
