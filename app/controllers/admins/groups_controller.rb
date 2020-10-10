class Admins::GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group, only: [:show, :destroy]

  def index
    @groups = Group.page(params[:page]).per(20).order(created_at: :desc)
    @group_count_day = Group.where(created_at: Time.zone.now.all_day)#本日の登録者数
    @group_count_all = Group.all
  end

  def destroy
    @group.destroy
    redirect_to admins_groups_path
  end

  def show
    @chats = @group.group_chats.page(params[:page]).per(20).order(created_at: :desc)
    @chat_count_day = @chats.where(created_at: Time.zone.now.all_day)
    @chat_count_all = @group.group_chats.all
  end


  private
  def set_group
    @group = Group.find(params[:id])
  end
end
