class Api::V1::Resolvers::CreateUser < GraphQL::Function
  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'
    argument :data, Api::V1::Types::AuthProviderEmailInput
  end
  type do
    name 'SignUpPayload'
    field :token, types.String
    field :user, Api::V1::Types::UserType
  end
  argument :name, !types.String
  argument :last_name, !types.String
  argument :website, !types.String
  argument :authProvider, !AuthProviderInput


  def call(_obj, args, _ctx)
    admins_length = User.with_role(:admin).length
    user = User::User.new(
      name: args[:name],
      last_name: args[:last_name],
      website: args[:website],
      email: args[:authProvider][:data][:email],
      password: args[:authProvider][:data][:password],
      signed_count: 1,
      last_sign_in: Time.now
    )
    if admins_length < 1
      user.add_role(:admin) 
    end
      # response = user.save
    if user.save
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")
      has_token = user.tokens.create!(token: token)
    end
    
    OpenStruct.new({
      user: user,
      token: token
  })
  end
end