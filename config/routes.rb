Rails.application.routes.draw do
  resources :documents
  resources :messages
  root to: 'notifications#index'
  
  mount ActionCable.server => '/cable'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
