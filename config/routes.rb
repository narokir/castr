Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :members, controllers: {
                         omniauth_callbacks: "members/omniauth_callbacks",
                         registrations: "members/registrations",
                       }
end
