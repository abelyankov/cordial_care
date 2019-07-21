Rails.application.routes.draw do
  # devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, skip: [:sessions]
  devise_scope :user do
    get 'erp/login', to: 'devise/sessions#new', as: :new_user_session
    post 'erp/login', to: 'devise/sessions#create', as: :user_session
    delete 'erp/logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  scope module: 'erp', path: 'erp' do
    root 'home#index'
    resources :sales
  end
end
