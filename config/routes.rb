Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root to: "home#index"
  resources :room_messages
  resources :rooms
  devise_for :users
  # root controller: :rooms, action: :index
  get "/home" => "home#index"
  resources :chats, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  resources :group_chats
  resources :group_chat_users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
