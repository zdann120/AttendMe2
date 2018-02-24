Rails.application.routes.draw do
  namespace :self_service do
    resources :cancellations, only: [:new, :create]
  end
  get '/cancel', to: 'self_service/cancellations#new'
  resources :events do
    resources :registrations do
      get 'ticket', on: :member, to: 'registrations#ticket'
      patch 'approve', on: :member, to: 'registrations#approve'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#root"
end
