Soundshare::Application.routes.draw do
  
resources :tracks, except: [:update, :edit]

resources :sessions, only: [:new, :create, :destroy]

resources :users

resources :comments

root :to => 'home#index'

get "/signup", to: "users#new",         as: "signup"
get "/login",  to: "sessions#new" ,     as: "login"
delete "/logout", to: "sessions#destroy",  as: "logout"

get "/tracks/:track_id/comments/:comment_id/flag", to: "comments#flag"
get "/flagged_comments", to: "comments#flagged"

end
