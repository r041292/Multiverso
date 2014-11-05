Multiverso::Application.routes.draw do
 

  resources :histories

  resources :publications

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

 end
