class ChatsController < ApplicationController
  def index
    @my_chats = current_user.chats
    @chat_partners = User.where.not(id:current_user.id) #自分以外のuser
  end

  def show
    @partner = User.find(params[:id])
    @chats_by_myself = Chat.where(user_id: current_user.id, partner_id: @partner.id)
    @chats_by_other = Chat.where(user_id: @partner.id, partner_id: current_user.id)
    @chats = @chats_by_myself.or(@chats_by_other) #リレーションオブジェクトたちを結合する
    @chats = @chats.order(:created_at)
    @chat = Chat.new(partner_id: @partner.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
  end

private
def chat_params
  params.require(:chat).permit(:sentence, :partner_id)
end

end
