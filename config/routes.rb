Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'

  resources :users ,only: [:index, :show, :edit, :update]
  resources :owners
  resources :quotations
  resources :clients
  
  get 'unsubscribe/:name' => 'users#unsubscribe', as: 'confirm_unsubscribe' #退会画面へ遷移
  patch '/users/:id/unsubscribe' => 'users#withdraw', as: 'unsubscribe_withdraw_user' #会員ステータス切り替え
  #put 'withdraw/:name' => 'users#withdraw'

end
