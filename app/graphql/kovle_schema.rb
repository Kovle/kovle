KovleSchema = GraphQL::Schema.define do
  mutation(Api::V1::Types::MutationType)
  query(Api::V1::Types::QueryType)
  resolve_type -> (object,args, ctx) {
    type_name = object.class.name
    Schema.types[type_name]
  }
end
