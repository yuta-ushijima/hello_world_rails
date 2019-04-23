class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @message = "Hello Rails!"
  end
end
