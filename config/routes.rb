Rails.application.routes.draw do
  
  devise_for :users, :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => "register"}, :controllers => { :registrations => "registrations" }
  resources :companies, except: [:edit] do
    post :get_all_branches
  end
  resources :accounts do
    collection do
      post :extract_users_by_account_holer_type
      post :account_names
    end
  end
  resources :clients do
    member do
      post :change_status
    end
  end
  resources :products
  resources :payrolls, only: [:index]
  resources :reports, only: [:index]
  resources :sales
  resources :settings, only: [:index]
  resources :suppliers do
    member do
      post :change_status
    end
  end
  resources :work_heads, only: [:index, :create, :destroy, :update]
  resources :workers do
    member do
      post :change_status
    end
  end
  resources :filtration, only: []  do
    collection do
      post :filtration_logic_of_factories
      post :filtration_logic_of_branches
      post :worker_or_manager
    end
  end
  resources :user do
    get :dashboard
  end

  resources :orders do
  end

  resources :products do
    member do
      post :get_price
    end
  end
  root "home#index"
end
