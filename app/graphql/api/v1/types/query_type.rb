Api::V1::Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :currentUser, Api::V1::Types::UserType do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      ctx[:current_user]
    }
  end
end
