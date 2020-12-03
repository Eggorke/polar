Rails.application.routes.draw do
  devise_for :users
  root 'base#index'
  get 'contacts', to: 'base#contacts', as: 'contacts'
  get 'about', to: 'base#about', as: 'about'
end
