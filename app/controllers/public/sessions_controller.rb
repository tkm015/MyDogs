# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_customer, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # ログイン後遷移ページ
  def after_sign_in_path_for(resource)
    public_top_path
  end

  # ログアウト後遷移ページ
  def after_sign_out_path_for(resource)
    public_top_path
  end

  protected

  def reject_customer
    @customer = Customer.find_by(email: params[:public_customer][:email])
    if @customer
      if @customer.active_for_authentication? == "退会"
        flash[:notice] = "退会済みです。"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
