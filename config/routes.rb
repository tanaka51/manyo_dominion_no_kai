ManyoDominionNoKai::Application.routes.draw do
  resources :notes, only: %i|index show new create| do
    member do
      get 'replay', action: 'replay'
    end
  end

  root "welcome#index"
end
