ManyoDominionNoKai::Application.routes.draw do
  resources :notes, only: %i|index show new create|

  root "welcome#index"
end
