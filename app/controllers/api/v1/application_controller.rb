module Api::V1
  class ApplicationController < ActionController::API
    before_action :authenticate_user!

    private

    def authenticate_user!
      unless current_user
        render json: { error: "Unauthorized access. You must be logged in to perform this action." }, status: :unauthorized
      end
    end    

    def current_user
      @current_user ||= User.find_by_token_for(:login, auth_token) if auth_token
    end

    def auth_token
      @auth_token ||= auth_header
    end

    def auth_header
      request.headers['Authorization']&.split(' ')&.last
    end
  end
end
