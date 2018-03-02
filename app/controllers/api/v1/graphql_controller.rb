class Api::V1::GraphqlController < ApplicationController
  before_action :cors_set_access_control_headers
  # skip_before_action :verify_authenticity_token
  def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = "*"
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
      headers['Access-Control-Max-Age'] = "1728000"
  end

  def options_request
    head :ok
  end
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # Query context goes here, for example:
      current_user: User.first,
    }
    result = KovleSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  end

  private

  def search_user
    @secret_token = request.headers['Authorization']
    search_token(@secret_token)
  end

  def search_token(token)
    unless token === "null" || token.nil?
      @token_db = Token.find_by(token: request.headers['Authorization']) 
    end
    set_member(@token_db)
  end

  def set_member(token_db)
    if token_db != nil
      @current_member = token_db.user
    else
      @current_member = nil # Cambiar esto !*!
    end
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
