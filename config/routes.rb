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

  resources :book_codes do
    collection do
      post :generate_book_codes
    end
  end

  resources :grades do
    member do
      get :subjects
    end
    resources :subjects do
      resources :courses
      delete :destroy_detail_imgs, on: :member
      get :generate_qr_code_image, on: :member
    end
  end

  resources :static_images do
    collection do
      get :play
    end
  end

  namespace :api do
    namespace :v1 do
      resources :main_page, only: [] do
        collection do
          get :top_video
          get :subjects
        end
      end

      resources :video, only: [] do
        collection do
          get :play
        end
      end

      resources :courses, only: [] do
        collection do
          get :data
        end
      end

      resources :subjects, only: [:show] do
        collection do
          get :check_subject_owner
          get :my_subjects
          get :search
        end
      end

      resources :wechats, only: [] do
        get :wechat_auth, on: :collection
      end

      resources :feedbacks, only: [:create]
      resources :book_codes, only: [:create]
      resources :setting, only: [] do
        collection do
          get :user_agreement
          get :privacy_policy
        end
      end

      resources :text_settings, only: [] do
        collection do
          get :book_code_comment
        end
      end
    end
  end

  resources :customers, only: [:index]
  resources :feedbacks
  resources :text_settings

  post 'areas/cities'
  post 'areas/districts'

  get 'login' => 'session#new', as: :login
  get 'logout' => 'session#destroy', as: :logout

  root 'session#index'
end
