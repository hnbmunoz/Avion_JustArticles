Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/article' => 'articles#index'
  get '/article/new' => 'articles#new', as: 'new_article'
  get '/article/:id(.:format)' => 'articles#show', as: 'show_article'
  get '/article/:id(.:format)/edit' => 'articles#edit', as: 'edit_article'
  post '/article/create' => 'articles#create', as: 'create_article'
  delete '/article/:id(:format)'   => 'articles#destroy', as: 'destroy_article'
  patch '/article/:id(.:format)/edit' => 'articles#update', as: 'update_article'
  # resources :article
end
