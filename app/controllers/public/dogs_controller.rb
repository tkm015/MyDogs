class Public::DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update]
  before_action :set_side, only: [:show]
  def new
    @dog = Dog.new
    @dog_breeds = DogBreed.all
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.customer_id = current_public_customer.id
    if @dog.save
      redirect_to public_dog_path(@dog)
    else
      @dog_breeds = DogBreed.all
      render "new"
    end
  end

  def show
    @dog_posts = Post.where(dog_id: @dog.id).order('created_at DESC').limit(6)
  end

  def edit
  end

  def update
    @dog.customer_id = current_public_customer.id
    if @dog.update(dog_params)
      redirect_to public_dog_path(@dog)
    else
      render "edit"
    end
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    redirect_to public_customer_path(current_public_customer)
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
    @dog_breeds = DogBreed.all
  end

  # サイド用データ取得
  def set_side
    @new_posts = Post.order(created_at: :desc).limit(9)
    @popular_tags = Post.tag_counts_on(:tags).order('count DESC').limit(10)
    @dog_ids = Relationship.group('dog_id').order('count_all DESC').limit(2).count.keys
  end

  def dog_params
    params.require(:dog).permit(:dog_breed_id, :name, :date_of_birth, :sex, :introduction, :cover_image, :profile_image)
  end
end
