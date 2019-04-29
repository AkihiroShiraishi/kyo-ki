class CommentsController < ApplicationController
  def create
    comment = Comment.create(text: comment_params[:text], rate: comment_params[:rate], article_id: comment_params[:article_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to "/articles/#{comment.article.id}"}
      format.json
    end

  end

  private
  def comment_params
    params.permit(:text, :article_id, :rate)
  end
end
