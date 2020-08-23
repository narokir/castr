Rails.application.routes.draw do
  resources :jobs
  root to: "pages#home"
  devise_for :members, controllers: {
                         omniauth_callbacks: "members/omniauth_callbacks",
                         registrations: "members/registrations",
                       }
end
