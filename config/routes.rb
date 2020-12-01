Rails.application.routes.draw do
  devise_for :users
  root 'base#index'
end
