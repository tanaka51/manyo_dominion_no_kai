ManyoDominionNoKai::Application.routes.draw do
  resources :notes

  root "welcome#index"
end
