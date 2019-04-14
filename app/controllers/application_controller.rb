class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def current_user
    @current_user ||= User.first
  end

  def authenticate_user!
    current_user.nil? ? auth_error : current_user
  end

  def auth_error
    render json:
      {
        errors: {
          status: 403,
          messages: "ログインしてください",
        },
      }
  end
end
