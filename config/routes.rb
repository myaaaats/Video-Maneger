Rails.application.routes.draw do
  devise_for :users
  root 'videos#index'

  resources :videos do
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
end
