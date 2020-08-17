class Public::ChatsController < ApplicationController
    def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)#ユーザーテーブルから自分を含むルームをさがす
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)#相ユーザーテーブルから相手のIDとルームID(自分のidを含む)を探す。

    unless user_rooms.nil?#すでに両者を含んだルームは作られているか？
        @room = user_rooms.room
    else #相手と共通のルームがみつからなければルーム作成
        @room = Room.new
        @room.save
        UserRoom.create(user_id: current_user.id, room_id: @room.id)
        UserRoom.create(user_id: @user.id, room_id: @room.id)
    end
    #チャット内容表示
    @chats = @room.chats
    #チャットメッセージ作成
    @chat = Chat.new(room_id: @room.id)
    end

    def create
        @chat = current_user.chats.new(chat_params)
        @chat.save
    end

    private
    def chat_params
        params.require(:chat).permit(:message, :room_id)
    end
end
