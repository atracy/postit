PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:create]

  resources :posts, except: [:destroy] do
    member do
      post 'votes' # /posts/:id/votes
    end
    resources :comments, only: [:create]
      member do
        post 'votes'
      end
  end

  #collection do
  #  post 'votes' # /posts/votes
  #end

  resources :categories, only: [:new, :create]


end
