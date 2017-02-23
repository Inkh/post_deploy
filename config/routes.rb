Rails.application.routes.draw do
  get '/' => 'users#index'

  get 'view/:id'

  post 'register' => 'users#register'


  get 'users/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
