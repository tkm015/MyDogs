class Public::RelationshipsController < ApplicationController
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
    @customers = Customer.find(customer_ids)
  end

  def follows
  end
end
