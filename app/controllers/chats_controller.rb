class ChatsController < ApplicationController
 before_action :authenticate_user!

 def index
  @users = User.all.page(params[:page]).per(10)
 end

 def show
  @user = User.find(params[:id])
  rooms = current_user.user_rooms.pluck(:room_id)
  user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

  if user_rooms.nil? #チャットroomがない場合新規作成
   @room = Room.new
   @room.save
   UserRoom.create(user_id: @user.id, room_id: @room.id) #チャット相手のroom作成
   UserRoom.create(user_id: current_user.id, room_id: @room.id) #カレントユーザーのroom作成
  else #チャットルームがすでにある場合の分岐
   @room = user_rooms.room
  end

  @chats = @room.chats
  @chat = Chat.new(room_id: @room.id)
 end

 def create
  @chat = current_user.chats.new(chat_params)
  @chat.save! #非同期通信のため、redirect先の記載なし
 end

 private

 def chat_params
  params.require(:chat).permit(:message, :room_id)
 end

end
