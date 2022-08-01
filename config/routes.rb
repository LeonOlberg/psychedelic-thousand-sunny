Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'referral', to: 'referral#index'
  get 'referral/:id', to: 'referral#show'
  post 'referral', to: 'referral#create'
  delete 'referral', to: 'referral#destroy'
end
