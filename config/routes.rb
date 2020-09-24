Rails.application.routes.draw do
  #get "accounts/index"
  #get "accounts/show"

  # resource :member do
  #   resource :account, only: [:show]
  # end

  resources :jobs do
    member do
      put :publish
      put :unpublish
      put :apply
    end
  end

  resource :member, only: [:edit] do
    resource :account, only: [:show]
    collection do
      patch "update_password"
      patch "delete_profile_photo"
    end
  end

  root to: "pages#home"
  get "/search", to: "jobs#search"
  get "/hello", to: "pages#hello"
  get "/goodbye", to: "pages#goodbye"
  devise_for :members,
             controllers: {
               omniauth_callbacks: "members/omniauth_callbacks",
               registrations: "members/registrations",
             }
end
