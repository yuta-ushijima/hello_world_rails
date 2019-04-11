class ArticlesController < ApplicationController
  before_action :set_article, only: [:update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @articles = Article.is_published.all.includes(:user)
    render json: @articles
  end

  def show
    if current_user
      @article = current_user.articles.find(params[:id])
    else
      @article = Article.is_published.find(params[:id])
    end
    render json: @article
  end

  def create
    @article = current_user.articles.create!(article_params)
    render json: @article
  end

  def update
    @article.update!(article_params)
    render json: @article
  end

  def destroy
    @article.destroy!
    render json: {}, status: 204
  end

  private
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :user_id)
    end
end
