class Public::DogsController < ApplicationController
  def new
    @dog = Dog.new
    @dog_breeds = DogBreed.all
  end

  def create
    dog = Dog.new(dog_params)
    dog.customer_id = current_public_customer.id
    dog.save
    redirect_to public_dog_path(dog)
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
  end

  def update
  end

  def detsroy
  end
  private
  def dog_params
    params.require(:dog).permit(:dog_breed_id, :name, :date_of_birth, :sex, :introduction, :cover_image, :profile_image)
  end
end
