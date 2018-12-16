Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'question#index'

  get '/', to: 'question#index', as: :question_index
  get '/play', to: 'question#play', as: :question_play

  resources :vocabularies, :except => ["show"]
  resources :scores, :only => ["index", "create"]
end
