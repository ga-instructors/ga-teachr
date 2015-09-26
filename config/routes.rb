Rails.application.routes.draw do

  root to: 'authentications#new'
  resources :authentications, path: 'auth'
  get '/auth/:provider/callback', to: 'authentications#create'

  resources :students
  resources :cohorts do
    resources :groups
  end
  resources :courses
  resources :employees
  resources :campuses
  resources :campus
  get '/style-guide' => 'style_guide/examples#index'

end
