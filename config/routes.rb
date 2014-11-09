Multiverso::Application.routes.draw do
 

  resources :histories, :publications
  get "/continue_publication" => "publications#continue_publication"
  post "/continue_publication/new" => "publications#create_continue_publication"

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  root to: "publications#index"

 end
