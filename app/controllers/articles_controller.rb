class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @current_user = current_user
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    respond_to do |format|
      if article.save
        format.html { redirect_to articles_path, notice: '글이 성공적으로 작성되었습니다.' }
        format.json { render :show, status: :created, location: article }
      else
        format.html { redirect_to :back, notice: article.errors[:title].first}
        format.json { render json: article.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @article = Article.find(params[:id])
    @current_user = current_user
  end

  def edit
    @article = Article.find(params[:id])
    unless @article.user_id == current_user.id
      redirect_to :back
    end
  end

  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_path, notice: '글이 성공적으로 수정 되었습니다.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { redirect_to :back, notice: @article.error[:title].first }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      respond_to do |format|
        if article.destroy
          format.html { redirect_to articles_path, notice: '글이 성공적으로 삭제 되었습니다.' }
        end
      end
    else
      flash[:alert] = "삭제 권한이 없습니다."
      redirect_to :back
    end
  end


  private
    def article_params
      params.require(:article).permit(:title, :content)
    end

end
