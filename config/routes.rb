Multiverso::Application.routes.draw do
 

  resources :histories, :publications
  get "/continue_publication" => "publications#continue_publication"
  post "/continue_publication/new" => "publications#create_continue_publication"
  get "/search" => "publications#search"
  get "/show_history_continuation" => "histories#show_history_continuation"
  post "/show_history_continuation/continue_with_posted_publication" => "histories#continue_with_posted_publication"
  get "/show_history_include_publication" => "histories#show_history_include_publication"

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  root to: "publications#index"

 end
