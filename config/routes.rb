Rails.application.routes.draw do
	devise_for :users

  root 'pages#index'
  resources :organizations do 
	   resources :invoices, shallow: true
  end

	resources :analytics, only: [:index, :create, :new, :destroy]
	resources :costbreakdowns, only: [:index, :create, :new, :destroy]

end