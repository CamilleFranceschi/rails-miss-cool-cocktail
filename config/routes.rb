Rails.application.routes.draw do
  root to: 'cocktails#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get    "cocktails",          to: "cocktails#index"

  # get    "cocktails/:id",      to: "cocktails#show"

  # get    "cocktails/new",      to: "cocktails#new"
  # post   "cocktails",          to: "cocktails#create"

  # get    "cocktails/:id/edit", to: "cocktails#edit"
  # patch  "cocktails/:id",      to: "cocktails#update"

  # delete "cocktails/:id",      to: "cocktails#destroy"
  resources :cocktails do
    resources :doses, only: [:create ] # no need new route anymore
  end
end

