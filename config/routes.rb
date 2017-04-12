Rails.application.routes.draw do
  get 'stories/index'
  resources :stories do
    resources :comments
  end
  root 'stories#index'

  get  '/signup' => 'users#new'
  post '/users'  => 'users#create'

  get  '/login'   => 'sessions#new'
  post '/login'   => 'sessions#create'
  get  '/logout'  => 'sessions#destroy'

  mount Shrine::DownloadEndpoint => "/attachments"
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
