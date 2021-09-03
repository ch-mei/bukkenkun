Rails.application.routes.draw do

  devise_for :users
  #root to: 'devise/sessions#new'
  root to: 'homes#top'
end
