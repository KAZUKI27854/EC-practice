Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  namespace :admin do
    resources :customers
  end

  namespace :customer do
    resources :orders
    post '/confirm' => 'orders#confirm'
  end
end
