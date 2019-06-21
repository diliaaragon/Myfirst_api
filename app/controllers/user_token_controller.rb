class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token, raise: false

  rescue_from Knock.not_found_exception_class_name, with: :not_found

  def not_found
    render json: { error: 'Invalid email/password' }, status: :not_found
  end
end
