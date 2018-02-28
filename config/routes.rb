Rails.application.routes.draw do

  get 'articles/index'

  get 'articles/one'

  get 'articles/two'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'

  resources :posts do
    resources :comments, only: :create
  end
  
end
