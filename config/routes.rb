Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'

  root 'static_pages#home'  
end
