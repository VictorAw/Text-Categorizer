Rails.application.routes.draw do
  resources :text_analyzer, only: [:index]
end
