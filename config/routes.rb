Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :members, skip: [:sessions]
  devise_scope :member do
    get 'erp/login', to: 'devise/sessions#new', as: :new_member_session
    post 'erp/login', to: 'devise/sessions#create', as: :member_session
    delete 'erp/logout', to: 'devise/sessions#destroy', as: :destroy_member_session
  end

  scope module: 'erp', path: 'erp' do
    root 'home#index'
    resources :sales
    resources :members
    resources :profile
  end
end
