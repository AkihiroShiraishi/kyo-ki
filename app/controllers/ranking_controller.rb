class RankingController < ApplicationController
  before_action :RankingController
  layout 'application'
  def ranking
    @ranking = Article.limit(10)
  end
end
