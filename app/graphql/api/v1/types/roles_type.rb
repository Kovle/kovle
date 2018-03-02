Api::V1::Types::RolesType = GraphQL::ObjectType.define do
    interfaces [Api::V1::Types::ActiveRecordInterface]
    name "Roles"
    description "User roles"
    field :name, !types.String
end