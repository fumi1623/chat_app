Rails.application.routes.draw do

  mount ActionCable.server => "/cable"
  resources :rooms, only: [:index, :new, :show, :create] do
    resources :messages, only: [:create]
  end
  root to: "rooms#index"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

end
