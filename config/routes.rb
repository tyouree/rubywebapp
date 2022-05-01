Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  #
  #

  root 'menu_index#index'

  get '/menu_index' , to: 'menu_index#index'

  get    '/login',   to: 'login#new'
  post   '/login',   to: 'login#auth'
  get   '/index',   to: 'login#index'
  delete '/logout',  to: 'login#destroy'

end
