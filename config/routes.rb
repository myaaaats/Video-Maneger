Rails.application.routes.draw do
  resources :videos do
    collection do
      post :confirm
    end
  end
end
