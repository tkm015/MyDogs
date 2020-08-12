class Admin::DogBreedsController < ApplicationController
  before_action :authenticate_admin_admin!
  def index
    @dog_breed = DogBreed.new
    @dog_breeds = DogBreed.page(params[:page]).order('created_at DESC').per(10)
    @dog_breed_count = DogBreed.all
  end

  def create
    dog_breed = DogBreed.new(dog_breed_params)
    dog_breed.save
    redirect_to admin_dog_breeds_path
  end

  def destroy
    dog_breed = DogBreed.find(params[:id])
    dog_breed.destroy
    redirect_to admin_dog_breeds_path
  end

  private

  def dog_breed_params
    params.require(:dog_breed).permit(:name)
  end
end
