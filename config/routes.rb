Rails.application.routes.draw do
  namespace :survey do
  end
  root to: 'authentications#new'

  resources :authentications, path: 'auth'
  get '/auth/:provider/callback', to: 'authentications#create'

  resources :students
  resources :courses
  resources :employees
  resources :campuses
  resources :cohorts do
    resources :groups
    resources :students, module: 'cohorts'
    resources :exit_tickets, module: 'survey', path: 'exit-tickets'
    resources :quizzes, module: 'survey'
  end
  namespace :survey do
    concern :questionnaires do
      resources :questions
      resources :responses
      resources :evaluations
    end
    resources :questionnaires, concerns: :questionnaires
    resources :quizzes, concerns: :questionnaires
    resources :exit_tickets, concerns: :questionnaires, path: 'exit-tickets'
    resources :questions
    resources :responses
  end

  get '/api/v1/markdown-preview' => 'api/markdown_preview#preview', as: 'api_markdown_preview'

  get '/style-guide' => 'style_guide/examples#index'

end
