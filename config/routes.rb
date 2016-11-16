Rails.application.routes.draw do

  devise_for :birds, :controllers => {
  		registrations: "birds/registrations",
        sessions: "birds/sessions"
      }
  root "tweets#index"

  resources :birds do
  	resources :tweets
  end

  resources :tweets
  # , only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
