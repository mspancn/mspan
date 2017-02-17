Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  devise_for :students, controllers: { sessions: 'students/sessions', registrations: 'students/registrations' }
  devise_for :teachers, controllers: { sessions: 'teachers/sessions', registrations: 'teachers/registrations' }

  namespace :student do
    root 'home#dashboard'

    resources :teachers, only: [:index, :show, :create, :destroy]
    resources :appointments, only: [:index, :new, :create, :update]
    resource :profile, only: [:edit, :update]
    
    match 'about', :to => 'home#about', via: :get
    match 'contact', :to => 'home#contact', via: :get
    match 'follow', :to => 'home#follow', via: :get
    match 'lesson', :to => 'home#lesson', via: :get
    match 'tuition', :to => 'home#tuition', via: :get
    match 'trial', :to => 'home#trial', via: :get
    match 'zoom', :to => 'home#zoom', via: :get
    match 'rule', :to => 'home#rule', via: :get
    match 'terms', :to => 'home#terms', via: :get
  end

  namespace :teacher do
    root 'home#dashboard'

    resources :availabilities, only: [:index, :create, :destroy]
    resources :appointments, only: [:index, :update]
    resource :profile, only: [:show]

    match 'about', :to => 'home#about', via: :get
    match 'contact', :to => 'home#contact', via: :get
    match 'terms', :to => 'home#terms', via: :get
    match 'lesson', :to => 'home#lesson', via: :get
    match 'issue', :to => 'home#issue', via: :get
    match 'manual', :to => 'home#manual', via: :get
    match 'pay', :to => 'home#pay', via: :get
    match 'help', :to => 'home#contact', via: :get
    match 'faq', :to => 'home#faq', via: :get

  end

  namespace :admin do
    root 'home#dashboard'

    resources :teachers, only: [:index, :edit, :update]
    resources :students, only: [:index, :edit, :update]
    resources :appointments, only: [:index]
    resources :teacher_payments, only: [:index, :new, :create]
    resources :student_payments, only: [:index, :new, :create]
  end

  match 'status', :to => 'home#status', via: :get
  match 'about', :to => 'home#about', via: :get
  match 'contact', :to => 'home#contact', via: :get
  match 'guidance', :to => 'home#guidance', via: :get
  match 'terms', :to => 'home#terms', via: :get
  match 'teacherhome', :to => 'home#teacherhome', via: :get
  match 'teacherfaq', :to => 'home#teacherfaq', via: :get
  match 'video_requirement', :to => 'home#video_requirement', via: :get

  root to: 'home#index'
end
