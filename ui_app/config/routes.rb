Rails.application.routes.draw do
  root to: 'visitors#index'

  resource :messages
end
