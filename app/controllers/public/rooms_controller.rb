class Public::RoomsController < ApplicationController
  before_action :authenticate_public_customer!, only: [:create, :show]

  def create
    @room = Room.create
    # Entriesテーブルにcurrent_customer.idと参加するroom_idを取得
    @join_current_customer = Entry.create(customer_id: current_public_customer.id, room_id: @room.id)
    # DM相手（参加ユーザー）の情報を取得
    @join_customer = Entry.create(room_params)
    # 最初のメセージ
    @first_message = @room.messages.create(customer_id: current_public_customer.id, message: "初めまして！")
    redirect_to public_room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    # Entriesテーブルに情報があるか確認
    if Entry.where(customer_id: current_public_customer.id, room_id: @room.id).present?
      # @roomの全てのメッセージ、エントリーcustomerを取得　新規メッセージを定義
      @messages = @room.messages.includes(:customer).order("created_at DESC")
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: public_top_path)
    end
  end

  private

  def room_params
    params.require(:entry).permit(:customer_id, :room_id).merge(room_id: @room.id)
  end
end
