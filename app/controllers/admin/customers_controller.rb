class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin_admin!
  def index
    @customers = Customer.page(params[:page]).order('created_at DESC').per(10)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    flash[:notice] = "登録情報を変更しました。"
    render 'edit'
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :date_of_birth, :introduction, :cover_image, :profile_image, :is_active)
  end
end
