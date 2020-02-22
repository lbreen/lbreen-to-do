Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'

  resources :tasks, except: [:show, :destroy]

  post "/tasks/:id/complete", to: "tasks#complete", as: :complete_task
end
