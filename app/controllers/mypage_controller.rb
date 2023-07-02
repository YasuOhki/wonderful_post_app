class MypageController < ApplicationController
  before_action :set_search_article, only:  %i[ show ]

  # GET /mypage
  def show
    @articles = @articles.page(params[:page])
  end
end

private
  def set_search_article
    if params[:title] == nil
      @articles = current_user.articles
    else
      @articles = current_user.articles.where("title LIKE ?", "%#{params[:title]}%")
    end
  end
