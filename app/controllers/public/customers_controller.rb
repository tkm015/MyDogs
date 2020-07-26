class Public::CustomersController < ApplicationController
  def top
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer_path(customer)
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :date_of_birth, :introduction, :cover_image, :profile_image)
  end
end
