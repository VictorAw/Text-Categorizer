Rails.application.routes.draw do
  namespace :api do
    resources :text_analyzer, only: [:index]
  end

  root to: 'static_pages#root'
end
