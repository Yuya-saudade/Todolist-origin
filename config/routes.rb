Rails.application.routes.draw do
  get "tasks/index" => "tasks#index"
  
  get "/" => "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end