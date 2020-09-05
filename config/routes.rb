Rails.application.routes.draw do
  resources :jobs do
    member do
      put :publish
      put :unpublish
    end
  end
  root to: "pages#home"
  get "/hello", to: "pages#hello"
  get "/goodbye", to: "pages#goodbye"
  devise_for :members,
             controllers: {
               omniauth_callbacks: "members/omniauth_callbacks",
               registrations: "members/registrations",
             }
end
