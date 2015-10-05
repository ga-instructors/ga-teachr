Rails.application.routes.draw do
  root to: 'authentications#new'

  resources :authentications, path: 'auth'
  get '/auth/:provider/callback', to: 'authentications#create'

  resources :students
  resources :courses
  resources :employees
  resources :campuses
  resources :cohorts do
    resources :groups
    resources :students, controller: 'cohorts/students'
  end
  namespace :survey do
    resources :questionnaires do
      resources :questions
      resources :responses
    end
    resources :questions
    resources :responses
  end

  get '/api/v1/markdown-preview' => 'api/markdown_preview#preview', as: 'api_markdown_preview'

  get '/style-guide' => 'style_guide/examples#index'

end
