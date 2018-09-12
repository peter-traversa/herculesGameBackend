Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cards
    end
  end
  namespace :api do
    namespace :v1 do
      resources :decks
    end
  end
end
