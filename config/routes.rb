Rails.application.routes.draw do

  devise_scope :user do
    root "users/sessions#new"
  end
  #ログイン画面をトップ画面に

  devise_for :users, :controller => {
    sessions: 'users/sessions'
  }

  get '/top'=> 'homes#top'

  resources :users ,only: [:index, :show, :edit, :update]
  resources :owners do
    collection do
      get 'search' => 'owners#search'
    end
  end
  #検索窓追加のため

  resources :quotations
  get '/owner/:id/quotations/' => 'quotations#index', as: 'quotations_index'
  get '/owner/:id/quotations/new' => 'quotations#new', as: 'quotation_new'
  #物件の見積もり一覧取得のため

  resources :clients do
    collection do
      get 'search' => 'clients#search'
    end
  end
  #検索窓追加のため


  resources :chats
  resources :rooms, only: %i[create index show]
  resources :materials do
    collection do
      post 'update_all'
    end
  end

  get 'unsubscribe/:name' => 'users#unsubscribe', as: 'confirm_unsubscribe' #退会画面へ遷移
  patch '/users/:id/unsubscribe' => 'users#withdraw', as: 'unsubscribe_withdraw_user' #会員ステータス切り替え
  #put 'withdraw/:name' => 'users#withdraw'

  #resources :sales_outlets
  #resources :construction_shops

end
