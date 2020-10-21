class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @post_count_day = Post.where(created_at: Time.zone.now.all_day)
    @post_count_all = Post.all
    @group_count_day = Group.where(created_at: Time.zone.now.all_day) #本日作成のトークルーム数
    @group_count_all = Group.all #全てのトークルーム
    @user_count_day = User.where(created_at: Time.zone.now.all_day) #本日登録の登録者数
    @user_count_all = User.all #全てのの登録者数
    @give_count_day = Post.where(status: 1, updated_at: Time.zone.now.all_day) #本日の譲渡条件更新数
    @give_count_all = Post.where(status: 1) #すべての譲渡条件更新数
    @exc_count_day = Post.where(status: 2, updated_at: Time.zone.now.all_day) #本日の交換条件更新数
    @exc_count_all = Post.where(status: 2) #すべての交換条件更新数
  end
end
