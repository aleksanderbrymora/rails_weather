Rails.application.routes.draw do
  root :to => 'info#index'
  resources :animals
end
