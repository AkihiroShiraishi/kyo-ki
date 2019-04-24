class ArticlesController < ApplicationController

before_action :move_to_index, except: [:index, :show]

  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(20)
  end
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to root_path
    else
      redirect_to new_article_path(current_user)
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
      redirect_to users_path(current_user)
    else
      redirect_to root_path
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
      redirect_to users_path(current_user)
    end
  end
  private
  def article_params
    params.permit(:title, :text, :user_id).merge(user_id: current_user.id)
  end

end
