Sk8::Application.routes.draw do

  root 'session#new'

  resources :spots do
    resources :comments, only: [:index, :create, :destroy]
  end

  #login/logout
  get    'login'  => 'session#new'
  post   'login'  => 'session#create'
  delete 'logout' => 'session#destroy'
  get    'logout' => 'session#destroy'

  #password reset
  get    'reset/:code' => 'password#edit', as: :reset
  put    'reset/:code' => 'password#update'
  patch  'reset/:code' => 'password#update'

  #registration
  get    'registration' => 'registration#new'
  post   'registration' => 'registration#create'


end
