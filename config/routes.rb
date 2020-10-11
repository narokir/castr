Rails.application.routes.draw do
  resources :jobs do
    member do
      get :preview
      put :publish
      put :unpublish
      put :apply
      patch :remove_attachment
    end
  end

  # resources :members, only: [:edit] do
  #   resource :account, only: [:show]
  #   collection do
  #     patch "update_password"
  #     patch "delete_profile_photo"
  #   end
  # end

  root to: "pages#home"
  get "/search", to: "jobs#search"
  get "/hello", to: "pages#hello"
  get "/goodbye", to: "pages#goodbye"
  devise_for :members, controllers: { omniauth_callbacks: "members/omniauth_callbacks", registrations: "members/registrations" }
  resources :members, only: [:show, :edit_password] do
    collection do
      get :edit
      get :edit_password
      patch "update_password"
      patch "delete_profile_photo"
    end
  end
end
