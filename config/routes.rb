Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'referral', to: 'referral#index'
  get 'referral', to: 'referral#show'
  get 'referral', to: 'referral#create'
  get 'referral', to: 'referral#destroy'
end
