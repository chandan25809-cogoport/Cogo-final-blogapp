# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  respond_to :json

# private

private
def respond_with(resource, _opts = {})
  # auth_token = Devise::JWT::TokenGenerator.new(resource.class).generate(resource)
  # response.headers['Authorization'] = "Bearer #{auth_token}"
  if resource.persisted?
    render json:{
      status:{code:200,messages: 'User Signed in sucessfully',
      data: current_user}
    },status: :ok
  end
end
# def create
#   self.resource = warden.authenticate!(auth_options)
#   sign_in(resource_name, resource)
#   render json: {
#     status: { code: 200, message: "User signed in successfully", data: current_user }
#   }
# end
  
  def respond_to_on_destroy
    jwt_payload=JWT.decode(request.headers['Authorization'].split(' ')[1],Rails.application.credentials.fetch(:secret_key_base)).first
    current_user=User.find(jwt_payload['sub'])
    if current_user
      render json:{
        status:200,
        message:"Signed out sucessfully"
      },status: :ok
      else
        render json:{
          status: 401,
          message: "User has no active session",
        },status: :unauthourized
    end
  end
end
