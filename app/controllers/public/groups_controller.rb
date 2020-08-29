class Public::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end
  def new
    @group = Group.new
  end
  #トークルーム
  def show
      @group = Group.find(params[:id])
      group_room = GroupRoom.find_by(user_id: current_user.id, group_id: @group.id)
      if group_room.nil?#すでにカレントとグループを含んだルームは作られているか？
        GroupRoom.create(user_id: current_user.id, group_id: @group.id)
        @chats = @group.group_chats
        @chat = GroupChat.new(group_id: @group.id )
      else
        @chats = @group.group_chats
        @chat = GroupChat.new(group_id: @group.id )
      end
  end
  #新規ルーム作成
  def create
      group = Group.new(group_params)
      group.master_id = current_user.id
    if group.save
      GroupRoom.create(user_id: current_user.id,group_id: group.id)
      redirect_to group_path(group)
    else
      @group = Group.new
      render 'new'
    end
  end
  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
  end
  def group_params
    params.require(:group).permit(:room_title,:body, :thumbnail)
  end
end