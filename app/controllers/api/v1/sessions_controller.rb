module Api::V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]

    def create
      return render json: { error: "Please fill up email and password."}, status: :unprocessable_entity unless (login_params[:email] && login_params[:password]).present?
      if user = User.authenticate_by(login_params)
        user.update(last_sign_in_at: Time.current)
        render json: { notice: "You have signed successfully.", user: UserSerializer.new(user), token: user.generate_token_for(:login) }, status: :ok
      else
        render json: { error: 'Invalid email or password.' }, status: :unprocessable_entity
      end
    end

    def destroy
      render json: { notice: "You have been logged out." }, status: :ok
    end

    private

    def login_params
      params.require(:user).permit(:email, :password)
    end
  end
end
