Rails.application.routes.draw do

  devise_scope :user do
    root "users/sessions#new"
  end

  devise_for :users, :controller => {
    sessions: 'users/sessions'
  }

  get '/top'=> 'homes#top'

  resources :users ,only: [:index, :show, :edit, :update]
  resources :owners
  resources :quotations, only: [:show, :create, :new, :edit, :update, :destroy]
  get '/owner/:id/quotations/' => 'quotations#index', as: 'quotations_index'
  get '/owner/:id/quotations/new' => 'quotations#new', as: 'quotation_new'
  resources :clients
  resources :sales_outlets
  resources :construction_shops
  resources :chats
  resources :rooms, only: %i[create index show]
  resources :materials

  get 'unsubscribe/:name' => 'users#unsubscribe', as: 'confirm_unsubscribe' #退会画面へ遷移
  patch '/users/:id/unsubscribe' => 'users#withdraw', as: 'unsubscribe_withdraw_user' #会員ステータス切り替え
  #put 'withdraw/:name' => 'users#withdraw'

end
