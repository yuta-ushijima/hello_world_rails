class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :is_login?

  def current_user
    @current_user = User.first
  end

  def is_login?
    current_user.nil? ? auth_error : current_user
  end

  def auth_error
    render json:
      {
        errors: {
          status: 403,
          messages: "ログインしてください"
        }
      }
  end
end
