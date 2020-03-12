Rails.application.routes.draw do
  root to: 'tweets#top'
  resources :tweets do
    collection do
      post :top, :confirm
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
