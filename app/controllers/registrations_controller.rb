class RegistrationsController <  Devise::RegistrationsController
  private

    def sign_up_params
      params.require(:user).permit(:name, :description, :email, :password, :password_confirmation, :avatar)
    end

    def account_update_params
      params.require(:user).permit(:name, :description, :email, :password, :password_confirmation, :current_password, :avatar)
    end
end
