# frozen_string_literal: true

Rails.application.routes.draw do
  root "levels#show"
  post "levels/:id", to: 'levels#store'
  get "levels/:id/results", to: 'levels#results', as: "level_results"
  resources :levels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
