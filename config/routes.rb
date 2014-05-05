Sk8::Application.routes.draw do

  root 'site#index'

  get 'login' => 'session#new'

end
