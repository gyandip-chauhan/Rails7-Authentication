class User < ApplicationRecord
  has_secure_password
  has_one_attached :photo

  enum interested_in: { nothing: 0, mens_soccer: 1, womens_soccer: 2 }
  enum user_type: { normal: 0, admin: 1, coach: 2 }
  
  validates :email, presence: true
  validates :interested_in, inclusion: { in: interested_ins.keys }
  validates :user_type, inclusion: { in: user_types.keys }
  normalizes :email, with: -> email { email.downcase.strip }

  generates_token_for :login, expires_in: 15.minutes do
    last_sign_in_at
  end

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end
  
  generates_token_for :email_confirmation, expires_in: 24.hours do
    email
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
