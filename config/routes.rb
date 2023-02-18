Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
 
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  },defaults: { format: :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/member_details' => 'members#index'

  #Users
  #updating users
  patch '/users/:id', to: 'profiles#update'

  #Article apis
  post '/article', to:'articles#create'
  get '/userarticles', to:'articles#userarticles'
  get 'article/:id',to:'articles#articlebyid'
  patch '/article/:id',to:'articles#update'
  delete '/article/:id',to:'articles#destroy'

  #Public apis
  get '/articles', to:'public#articleindex'    
  get 'article/username/:id', to:'public#find_article_by_username'

  #Comments

  post '/comment/:article_id', to:'comments#create'

end
