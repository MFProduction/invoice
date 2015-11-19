class SubdomainConstraints
  def self.matches?(request)
    subdomains = %w{www admin api }
    request.subdomain.present? && !subdomains.include?(request.subdomain )
  end
end
Rails.application.routes.draw do
	devise_for :users
  root 'pages#index'
  resources :organizations 
  constraints SubdomainConstraints do
    resources :invoices do
      resources :dividers
    end
    resources :costcenters, only: [:index, :create, :new, :destroy]
    get '/members', to: 'members#index', as: 'members'
    get '/members/new', to: 'members#new', as: 'new_member'
    post '/members', to: 'members#create'
    delete '/members', to: 'members#destroy', as: 'destroy_member'
  end
  resources :analytics, only: [:index, :create, :new, :destroy]


end