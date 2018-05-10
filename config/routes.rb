Rails.application.routes.draw do

  
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  resources :donor_profiles
  devise_for :donors , :controllers => {registrations: "donors/registrations"}
  resources :business_profiles
  devise_for :businesses , :controllers => {registrations: "businesses/registrations"}
  resources :orders


  
  devise_scope :business do  
    get '/businesses/sign_out' => 'devise/sessions#destroy'     
 end

 devise_scope :donor do  
  get '/donors/sign_out' => 'devise/sessions#destroy'     
end

  get "/how-it-works" => "pages#how-it-works"

  get "/our-story" => "pages#our-story"

  get "/groceries" => "pages#groceries"

  get "/ready-to-eat" => "pages#ready"

  get "/current-listings" => "pages#current_listings"

  get "/past-listings" => "pages#past_listings"

  resources :charges, only: [ :create]
  

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
