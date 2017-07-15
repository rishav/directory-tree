Rails.application.routes.draw do

  root to: 'trees#index'
  resources :trees do
    resources :nodes, only:[:create, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
