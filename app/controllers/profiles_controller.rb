class ProfilesController <ApiController
    before_action :set_profile, only: [:show, :update, :destroy]
    def update
      user = User.find_by(id: params[:id])
    
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
        params.require(:user).permit(:name, :description, :image_url)
      end
    def set_profile
        # @company = Company.find(params[:id])
        @profile = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound => error
        render json: error.message, status: :unauthorized
      end


end