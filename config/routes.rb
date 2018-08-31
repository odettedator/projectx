Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/command_center/super_admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    invitations: 'users/invitations'
  }
  root to: 'home#index'
  get 'members', to: 'members#index'
  namespace :admin do
    root to: 'dashboard#index', as: :root
    resources :dashboard
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
