Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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

  match 'status', :to => 'home#status', via: :get
  match 'about', :to => 'home#about', via: :get
  match 'contact', :to => 'home#contact', via: :get
  match 'guidance', :to => 'home#guidance', via: :get
  match 'terms', :to => 'home#terms', via: :get
  match 'teacherhome', :to => 'home#teacherhome', via: :get
  match 'teacherfaq', :to => 'home#teacherfaq', via: :get

  root to: 'home#index'
end
