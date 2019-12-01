Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match "/delayed_job" => BetterDelayedJobWeb, :anchor => false, :via => [:get, :post]

  resources :delayed_jobs
  resources :favorites
  resources :notifications
  resources :sys_configs
  resources :sys_logs do
    get :search, on: :collection
  end

  resources :features do
    get :list, :on => :collection
    get :role_features_grid, :on => :member
    get :add_features, :on => :member
    get :add_features_submit, :on => :member
    delete :remove_feature_from_role, :on => :member
  end

  resources :roles do
    get :role_users_grid, :on => :member
    get :add_users, :on => :member
    get :add_users_submit, :on => :member
    delete :remove_user_from_role, :on => :member
  end

  resources :departments do
    resources :department_docs
    get :department, :on => :member
    get :add_users, :on => :member
    get :add_users_submit, :on => :member
    delete :remove_user_from_department, :on => :member
  end
  resources :users do
    get :reset_password, :on => :member
    get :edit_password, :on => :member
    post :update_password, :on => :member
    get :list, on: :collection
    get :show_api_key, on: :member
    post :generate_api_key, on: :member
  end

  resources :session do
    get :ao, on: :collection
    get :aologin, on: :collection
    post :aosignin, on: :collection
  end

  resources :book_codes
  resources :courses
  resources :grades do
    resources :subjects
  end

  post 'areas/cities'
  post 'areas/districts'

  get 'login' => 'session#new', as: :login
  get 'logout' => 'session#destroy', as: :logout

  root 'session#index'
end
