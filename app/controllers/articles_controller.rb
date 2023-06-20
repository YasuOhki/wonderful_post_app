class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /article
  def index
    if user_signed_in?
      tmp_user = User.all
      tmp_user = tmp_user[current_user.id - 1]
      if tmp_user != nil
        @user_articles = tmp_user.articles
        @user_articles = @user_articles.page(params[:page])
      else
        @user_articles = nil
      end

      @articles_read_only = Article.where.not(user_id: current_user.id)
      @articles_read_only = @articles_read_only.page(params[:page])
    else
      @user_articles = nil
      @articles_read_only = Article.all
      @articles_read_only = @articles_read_only.page(params[:page])
    end
  end

  # GET /article/1
  def show
  end

  # GET /article/new
  def new
    @article = Article.new
  end

  # GET /article/1/edit
  def edit
  end

  # POST /article
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: t('.success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article/1
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: t('.success') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article/1
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
