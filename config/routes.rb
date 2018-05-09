Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'articles/index'

  get 'articles/one'

  get 'articles/two'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'

  resources :posts do
    resources :comments, only: :create
  end

  resources :courses, except: :show
  
end
