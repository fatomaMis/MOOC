class RegistrationController < ApplicationController

    before_action :configure_permitted_parameters, if: :devise_controller?
    
    private
    def sign_up_params
      params.require(:user).permit(:username, :email, :password , :dob , :is_female , :pic)
    end

  private
    def account_update_params
      params.require(:user).permit(:username, :email, :password ,:current_password, :dob , :is_female , :pic)
    end
end
