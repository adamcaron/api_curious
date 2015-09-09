Rails.application.routes.draw do
  get  '/auth/instagram/callback', to: 'sessions#create'
  get  '/logout',    to: 'sessions#destroy'
  get  '/:nickname', to: 'users#show', as: 'profile'

  root 'home#show'
end