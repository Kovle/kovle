Api::V1::Types::UserType = GraphQL::ObjectType.define do
    name 'User'
    interfaces [Api::V1::Types::ActiveRecordInterface]
    
    field :id, !types.ID
    field :name, !types.String
    field :last_name, !types.String
    field :website, !types.String
    field :email, !types.String
    field :last_name, !types.String
    field :errors, types[types.String], "Reasons the object couldn't be created or updated" do
        resolve ->(obj, args, ctx) { obj.errors.full_messages }
    end
    field :roles, types[Api::V1::Types::RolesType], "User roles" do
        resolve ->(obj, args, ctx) { obj.roles }
    end
end