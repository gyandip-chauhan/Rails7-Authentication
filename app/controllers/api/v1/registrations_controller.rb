module Api::V1
  class RegistrationsController < ApplicationController
    skip_before_action :authenticate_user!
    
    def create
      user = User.new(registration_params)
      if user.save
        render json: { notice: "Login Successfully.", user: }, status: :ok
      else
        render json: { error: user.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    end
    
    private

    def registration_params
      params.require(:user).permit(:email, :first_name, :last_name, :grad_year, :state, :interested_in, :phone_number, :parent_household_income, :club, :team, :ref_code, :user_type, :is_verified, :sub_start_date, :sub_end_date, :got_details, :password, :password_confirmation)
    end
  end
end
