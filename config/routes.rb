Rails.application.routes.draw do

  root to: 'question#index'

  get '/', to: 'question#index', as: :question_index
  get '/play', to: 'question#play', as: :question_play
  post '/play', to: 'question#sumscore', as: :question_sumscore

  resources :vocabularies, :except => ["show"]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
