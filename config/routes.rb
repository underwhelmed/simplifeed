Simplifeed::Application.routes.draw do
  devise_for :users

  root :to => 'users#show'

  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth/failure' => 'authentications#failure'

  # Used for connecting facebook, etc. with an existing username/password account
  match '/connect/:provider' => 'authentications#connect'

  # Twitter, Facebook, and LinkedIn feeds
  match '/user/post' => 'users#post'

  # Google docs
  resources :documents
end
