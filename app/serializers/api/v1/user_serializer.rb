module Api::V1
  class UserSerializer < ApplicationSerializer

    attributes :email, :first_name, :last_name, :grad_year, :state, :interested_in, 
             :phone_number, :parent_household_income, :club, :team, :ref_code, 
             :user_type, :is_verified, :sub_start_date, :sub_end_date, :got_details, :last_sign_in_at

    attribute :full_name do |user|
      user.full_name
    end

    attribute :photo_url do |user|
      Rails.application.routes.url_helpers.rails_blob_url(user.photo, only_path: true) if user.photo.attached?
    end
  end
end
