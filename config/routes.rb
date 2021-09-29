Rails.application.routes.draw do
  resources :books
  root 'books#index'

  get ':controller(/:action(/:id))'

  # get 'books'
  # get 'books(/:title)'
  # get 'books/new'
  # post 'books'
  # patch 'books(/:title)'
  # delete 'books(/:title)'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
