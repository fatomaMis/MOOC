Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  match "/uploads/lecture/attachment/:id/:basename.:extension", :controller => "lectures", :action => "download", via: :post
  resources :courses
  resources :lectures
  resources :lectures do 
    resources :comments
    member do
      put "like", to: "lectures#upvote"
      put "dislike", to: "lectures#downvote"
    end
  end

  resources :lectures do
    member do
      get "spam" , to: "lectures#spam", as: "spam"
    end
  end

  root 'home#index'
  get 'home/index'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
