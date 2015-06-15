Georgia::Application.routes.draw do
  resources :charges

  root :to => 'home#index'
end
