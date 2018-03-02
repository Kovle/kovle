Rails.application.routes.draw do
  require 'sidekiq/web'
  post "/api/v1/graphql", to: "api/v1/graphql#execute"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/api/v1/graphiql", graphql_path: "/api/v1/graphql"
  end
  match "*unmatched", via: [:options], to: "api/v1/graphql#options_request"
  mount Sidekiq::Web => '/sidekiq'
end
