Rails.application.routes.draw do
	devise_for :users

  root 'pages#index'
  resources :organizations do 
	  resources :invoices, shallow: true
    resources :costcenters, shallow: true, only: [:index, :create, :new, :destroy]
    get '/members', to: 'members#index', as: 'members'
  end

	resources :analytics, only: [:index, :create, :new, :destroy]
	

end