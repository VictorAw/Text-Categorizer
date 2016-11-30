Rails.application.routes.draw do
  resources :text_analyzer, only: [:index]

  root to: 'static_pages#root'
end
