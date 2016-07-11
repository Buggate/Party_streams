


Rails.application.routes.draw do

  
  
  resources :comments
  resources :users

  devise_for :users, :controllers => { :invitations => 'users/invitations' }




 

  resources :charges
  
  resources :bookings do 
      member do
        put "like", to: "bookings#upvote"
        put "dislike", to: "bookings#downvote"
      end
      resources :comments
    end


  root "public#index"

  get '/about', to: 'pages#about'

  
end


