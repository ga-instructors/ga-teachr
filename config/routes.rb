Rails.application.routes.draw do

  resources :authentications, path: 'auth'
  get '/login' => 'authentications#new', as: 'login'

  resources :students
  resources :cohorts
  resources :courses
  resources :employees
  resources :campuses
  resources :campus
  root to: 'style_guide/examples#index'

end
