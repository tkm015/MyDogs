class Public::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit]
  before_action :set_side, only: [:top, :show]
  before_action :follows_new_posts, only: [:show]
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
  # サイド用データ取得
  def set_side
    @new_posts = Post.order(created_at: :desc).limit(9)
    @popular_tags = Post.tag_counts_on(:tags).order('count DESC').limit(10)
    @dog_ids = Relationship.group('dog_id').order('count_all DESC').limit(2).count.keys
  end

  def follows_new_posts
    follow_dogs = Relationship.where(customer_id: current_public_customer.id).pluck(:dog_id)
    @follows_new_posts = Post.where(dog_id: follow_dogs).order('created_at DESC').limit(8)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :date_of_birth, :introduction, :cover_image, :profile_image)
  end
end
