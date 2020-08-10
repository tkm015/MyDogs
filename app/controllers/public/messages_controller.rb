class Public::MessagesController < ApplicationController
  before_action :set_room, only: [:create, :destroy]

  def create
    if Entry.where(customer_id: current_public_customer.id, room_id: @room.id)
      @message = Message.create(message_params)
      if @message.save
        # 非同期処理
        @message = Message.new
        gets_entries_all_messages
        render :message_index
      end
    else
      flash[:alert] = "メッセージ送信に失敗しました"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      # 非同期処理
      gets_entries_all_messages
      @message = Message.new
      render :message_index
    end
  end

  private
  def set_room
    @room = Room.find(params[:message][:room_id])
  end

  # 　参加者とすべてのメッセージを取得
  def gets_entries_all_messages
    @messages = @room.messages.includes(:customer).order("created_at DESC")
    @entries = @room.entries
  end

  def message_params
    params.require(:message).permit(:customer_id, :message, :room_id).merge(customer_id: current_public_customer.id)
  end
end
