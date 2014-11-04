Multiverso::Application.routes.draw do
 

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

 end
