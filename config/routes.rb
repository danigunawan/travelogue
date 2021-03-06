Rails.application.routes.draw do
  # resources :entries

  namespace :api do 
    resources :users do
      resources :entries
    end
  
    resources :places
    resources :categories
  
    post '/auth/login', to: 'authentication#login'
    get '/auth/verify', to: 'authentication#verify'
    get '/categorieswithplaces', to: 'categories#indexplaces'
    get '/query', to: 'query#places'
    get '/query/countries', to: 'query#countries'  
  end 

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end

end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html