Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'tweets#top'
    
    resources :tweets do
        collection do
            post:confirm
        end
    end
    
    get 'tweets/top'
end
