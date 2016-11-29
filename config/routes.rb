Rails.application.routes.draw do
  resources :textanalyzers, only: [:index]
end
