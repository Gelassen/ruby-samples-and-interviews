Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'welcome/index'
  
  root 'welcome#index'

  post 'say', to: 'cow#say'

  # get '/articles/new', to: 'articles#new'

  # get '/articles/:id', to: 'articles#show'

  # post '/articles/new', to: 'articles#create'

  # patch '/articles/edit', to: 'articles#edit'

  # get '/articles/edit/:id', to: 'articles#edit', as: 'articles_update'

  post '/articles/:id', to: 'articles#update'

  # get '/articles/:id', to: 'articles#destroy', as: 'delete_article'

  resources :articles, only: [:new, :edit, :index, :create, :show, :update, :destroy] do 
    resources :comments
  end

end
