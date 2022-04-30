Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  #
  #


  # main menu route
  get '/menu_index' , to: 'menu_index#index'

  root 'menu_index#index'
end
