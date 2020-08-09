class Public::RelationshipsController < ApplicationController
  before_action :set_side, only: [:followers, :follows]
  def create
    customer = current_public_customer
    dog = Dog.find(params[:dog_id])
    if dog.customer.id == customer.id
      redirect_back(fallback_location: public_root_path)
    else
      Relationship.find_or_create_by(customer_id: customer.id, dog_id: dog.id)
      redirect_back(fallback_location: public_root_path)
    end
  end

  def destroy
    customer = current_public_customer
    dog = Dog.find(params[:dog_id])
    relationship = Relationship.find_by(customer_id: current_public_customer.id, dog_id: dog.id)
    relationship.destroy if relationship
    redirect_back(fallback_location: public_root_path)
  end

  def followers
    @dog = Dog.find(params[:dog_id])
    followers = @dog.relationships.where(dog_id: @dog.id)
    customer_ids = []
    followers.each do |f|
      customer_ids.push(f.customer_id)
    end
    @customers = Kaminari.paginate_array(Customer.find(customer_ids)).page(params[:page]).per(8)
  end

  def follows
    @customer = Customer.find(params[:customer_id])
    follows = @customer.relationships.where(customer_id: @customer.id)
    dog_ids = []
    follows.each do |f|
      dog_ids.push(f.dog_id)
    end
    @dogs = Kaminari.paginate_array(Dog.find(dog_ids)).page(params[:page]).per(1)
  end

  private
  # サイド用データ取得
  def set_side
    @new_posts = Post.order(created_at: :desc).limit(9)
    @popular_tags = Post.tag_counts_on(:tags).order('count DESC').limit(10)
    @dog_ids = Relationship.group('dog_id').order('count_all DESC').limit(2).count.keys
  end
end
