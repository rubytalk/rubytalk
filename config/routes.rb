Rails.application.routes.draw do
  resources :members, only: [:new, :create]
  root 'members#new'
end
