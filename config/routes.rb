Rails.application.routes.draw do

  root 'top#index'
  devise_for :users

  resources :videos do
    resources :comments
    get 'filter', on: :member
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:index, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
