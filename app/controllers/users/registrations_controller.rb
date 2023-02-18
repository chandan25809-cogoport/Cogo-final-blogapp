# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [:show, :update] 
  respond_to :json


  def update

    render json: {  message: 'User updated successfully'}
    user = User.find_by(id: params[:id])
    # if user && user.update(account_update_params)
    # puts "params: #{account_update_params}"
    # self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
  
    # if resource.update(account_update_params)
    if user && user.update(account_update_params)
      render json: {
        status: { code: 200, message: 'User updated successfully', data: user }
      }, status: :ok
    else
      render json: {
        status: { message: 'User could not be updated', 
          errors: user.errors.full_messages }, status: :unprocessable_entity
      }
    end
  end



  private
  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :description, :image_url)
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :description, :image_url)
  end

  def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully', data: resource }
      }, status: :ok
    else
      render json: {
        status: { message: 'User could not be created successfull', 
          errors: resource.errors.full_messages }, status: :unprocessable_entity
      }
    end
  end
end
