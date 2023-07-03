class ArticlesController < ApplicationController
  # index, showはログイン状態とは無関係に処理するため、ログアウト状態ではスキップする
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_article, only: %i[ edit update destroy ]
  before_action :set_search_article, only:  %i[index]

  # GET /article
  def index
    @article = @article.page(params[:page])
  end

  # GET /article/1
  def show
    @article = Article.find(params[:id])
  end

  # GET /article/new
  def new
    @article = current_user.articles.new
  end

  # GET /article/1/edit
  def edit
  end

  # POST /article
  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: t("articles.create.success") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article/1
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: t("articles.update.success") }
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
      @article = current_user.articles.find(params[:id])
    end

    def set_search_article
      if params[:title] == nil
        @article = Article.all
      else
        @article = Article.where("title LIKE ?", "%#{params[:title]}%")
      end
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
