Rails.application.routes.draw do
  root "pages#home"
  
  get 'about', to: 'pages#about'
  get 'dashboard', to: 'pages#dashboard'
  
  get 'cars', to: 'pages#old_cars'
  get 'cars/:id', to: 'pages#showcar', as: 'showcar'

  
  get 'customers', to: 'pages#customers'
  get 'customers/:id', to: 'pages#showcustomer', as: 'showcustomer'
  
  get 'sales', to: 'pages#sales'
  get 'sales/:id', to: 'pages#sale', as: 'sale'
  
  get "up" => "rails/health#show", as: :rails_health_check
end
