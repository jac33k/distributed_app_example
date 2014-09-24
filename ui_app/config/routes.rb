Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :messages

  resources :invitations
end
