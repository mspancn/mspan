Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :student do
    root 'home#dashboard'

    resources :teachers, only: [:index, :create, :destroy]
    resources :appointments, only: [:index, :new, :create, :update]
  end

  namespace :teacher do
    root 'home#dashboard'

    resources :availabilities, only: [:index, :create, :destroy]
    resources :appointments, only: [:index, :update]
  end

  root to: 'home#index'
end
