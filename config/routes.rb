Rails.application.routes.draw do
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
