class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!

  def index
    @users = User.all
  end

  def create
    User.create!(user_params)
  end

  def show
  end

  def update
    @user.update!(user_params)
  end

  def destroy
    @user.destroy!
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:account, :name, :email)
    end
end
