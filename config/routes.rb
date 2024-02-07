Rails.application.routes.draw do
  namespace :users do
    get 'profiles/show'
    get 'profiles/edit/:id', to: 'profiles#edit'
    patch 'profiles/edit/:id', to: 'profiles#update'
  end
  get 'search', to: 'rooms#search', as: 'search'
  get 'users/index'
  get 'users/account'

  resources :rooms
  resources :reservations do
    collection do
      get 'confirm'
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

end