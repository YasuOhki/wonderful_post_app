class MypageController < ApplicationController

  # GET /mypage
  def show
    @article = current_user.articles
  end
end
