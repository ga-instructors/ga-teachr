Rails.application.routes.draw do

  resources :authentications, path: 'auth'
  root to: 'authentications#new'

  resources :students
  resources :cohorts
  resources :courses
  resources :employees
  resources :campuses
  resources :campus
  get '/style-guide' => 'style_guide/examples#index'

end
