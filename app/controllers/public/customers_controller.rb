class Public::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit]
  def top
  end

  def show
    @dog = current_public_customer.dogs
    if public_customer_signed_in?
      # cureent_customerがルームに参加しているか確認
      @current_public_customer_entry = Entry.where(customer_id: current_public_customer.id)
      # @customerがルームに参加しているか確認
      @customer_entry = Entry.where(customer_id: @customer.id)
      # @customerとcurent_customerが別ユーザーであるなら
      unless @customer.id == current_public_customer.id
        @current_public_customer_entry.each do |cpc|
          @customer_entry.each do |c|
            # @customerとcurent_customerで一致するroom.idがあるか確認
            if cpc.room_id == c.room_id
              @have_room = true
              @room_id = cpc.room_id
            end
          end
        end
        # @haveRoomに値がなければroomの新規作成
        unless @have_room
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def edit
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer_path(customer)
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :date_of_birth, :introduction, :cover_image, :profile_image)
  end
end
