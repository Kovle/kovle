Api::V1::Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # TODO: Remove me
  field :createUser, function: Api::V1::Resolvers::CreateUser.new
end
