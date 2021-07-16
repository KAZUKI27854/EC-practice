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
    resources :orders
    post 'orders/confirm' => 'orders#confirm', as: :order_confirm
    get 'orders/complete' => 'orders#complete', as: :order_complete
  end
end
