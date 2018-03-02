class Api::V1::Resolvers::SignInUser < GraphQL::Function
        argument :data, !Api::V1::Types::AuthProviderEmailInput
        type do
            name 'SignInPayload'
            field :token, types.String
            field :user, Api::V1::Types::UserType
        end
    
        def call(_obj, args, ctx)
            input = args[:data]
            return GraphQL::ExecutionError.new("SU. #1") unless input
            user = User.find_by(email: input[:email])
            return GraphQL::ExecutionError.new("SU. #2") unless user
            return GraphQL::ExecutionError.new("SU. #3") unless user.try(:authenticate,input[:password])
            UpdateSignInCountJob.perform_later(user)
            crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
            token = crypt.encrypt_and_sign("user-id:#{ user.id }")
            user.tokens.create!(token: token)
    
            OpenStruct.new({
                user: user,
                token: token
            })
        end
    
    end