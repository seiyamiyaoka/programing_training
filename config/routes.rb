Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    resources :users
    get 'dashboard', to: 'dashboard#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
