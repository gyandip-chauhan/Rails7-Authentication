Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      post "login", to: "sessions#create", as: "login"
      delete "logout", to: "sessions#destroy", as: "logout"
      post "signup", to: "registrations#create", as: "signup"
      post "change_password", to: "passwords#update", as: "change_password"
      post "forgot_password", to: "password_resets#create", as: "forgot_password"
      put "reset_password", to: "password_resets#update", as: "reset_password"
      resources :campions
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
