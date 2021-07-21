Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  namespace :admin do
    resources :customers
  end

  scope module: :customer do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :customers, only: [:show, :edit, :update]
    get 'customers/:id/destroy_confirm' => 'customers#destroy_confirm', as: :destroy_confirm
    patch 'customers/:id/withdraw' => 'customers#withdraw', as: :withdraw
    resources :orders, only: [:index, :show, :new, :create]
    post 'orders/confirm' => 'orders#confirm', as: :order_confirm
    get 'orders/confirm' => 'orders#new'
    get 'orders/complete' => 'orders#complete', as: :order_complete
    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete 'cart_items' => 'cart_items#all_destroy', as: :all_destroy
    resources :deliveries, only: [:index, :create, :destroy, :edit, :update]
    resources :items, only: [:index, :show]
  end
end
