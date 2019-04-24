class UsersController < ApplicationController

  def index
    @user = User.find(params[:format])
    @articles = Article.where(user_id: params[:format])
  end

end
