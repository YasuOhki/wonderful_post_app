class MypageController < ApplicationController

  # GET /mypage
  def index
    @user_articles = Article.where(user_id: current_user.id)
  end
end
