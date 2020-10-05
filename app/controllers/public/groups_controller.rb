class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit, :update]
  before_action :set_group, only:[:show, :edit, :update, :destroy]

  def index
    @groups = Group.page(params[:page]).per(10).order(created_at: :desc)
  end
  def new
    @group = Group.new
  end
  #トークルーム
  def show
      group_room = GroupRoom.find_by(user_id: current_user.id, group_id: @group.id)
      if group_room.nil?#すでにカレントとグループを含んだルームは作られているか？
        GroupRoom.create(user_id: current_user.id, group_id: @group.id)#なければグループに参加させる
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
      @group = group
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
    sleep(3)
      redirect_to group_path(@group)
    else
      render 'edit'
    end
  end
  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end
  
  def screen_user
      group = Group.find(params[:id])
    unless group.master_id == current_user.id
        redirect_to groups_path
    end
  end
  def group_params
    params.require(:group).permit(:room_title,:body, :thumbnail)
  end
end