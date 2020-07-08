Rails.application.routes.draw do
  #Set root path for homepage
  root to: 'pages#home'

  #Adjusted routes to no longer show the controller name
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  #Resource routes
  resources :blogs do
    member do
      #Allows the enum to toggle between draft and published status
      get :toggle_status
    end
  end

  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
