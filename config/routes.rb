Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  #Set root path for homepage
  root to: 'pages#home'

  #Adjusted routes to no longer show the controller name
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  #Custom Routing for portfolio items
  get 'ruby-items', to: 'portfolios#ruby'  #Hard-coded example to access ruby category

  #Resource routes
  resources :blogs do
    member do
      #Allows the enum to toggle between draft and published status
      get :toggle_status
    end
  end

  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
