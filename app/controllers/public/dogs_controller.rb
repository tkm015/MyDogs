class Public::DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update]
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

  def dog_params
    params.require(:dog).permit(:dog_breed_id, :name, :date_of_birth, :sex, :introduction, :cover_image, :profile_image)
  end
end
