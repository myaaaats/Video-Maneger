Rails.application.routes.draw do

  root 'top#index'
  devise_for :users

  resources :videos do
    resources :comments
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
