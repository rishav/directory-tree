Rails.application.routes.draw do
  root to: 'trees#index'
  resources :trees

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
