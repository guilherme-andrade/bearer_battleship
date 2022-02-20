Rails.application.routes.draw do
  root to: 'battles#show'
  resource :battle, only: %i[show]
end
