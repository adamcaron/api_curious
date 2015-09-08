Rails.application.routes.draw do
  root 'home#show'
  get  '/auth/instagram/callback', to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'
end
