Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  devise_for :students, controllers: { sessions: 'students/sessions', registrations: 'students/registrations' }
  devise_for :teachers, controllers: { sessions: 'teachers/sessions', registrations: 'teachers/registrations' }

  namespace :student do
    root 'home#dashboard'

    resources :teachers, only: [:index, :show, :create, :destroy]
    resources :appointments, only: [:index, :new, :create, :update]
    resource :profile, only: [:edit, :update]
  end

  namespace :teacher do
    root 'home#dashboard'

    resources :availabilities, only: [:index, :create, :destroy]
    resources :appointments, only: [:index, :update]
    resource :profile, only: [:show]
  end

  namespace :admin do
    root 'home#dashboard'

    resources :teachers, only: [:index, :edit, :update]
    resources :students, only: [:index, :edit, :update]
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
