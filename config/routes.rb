Multiverso::Application.routes.draw do
 

  resources :histories, :publications

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  root to: "publications#index"

 end
