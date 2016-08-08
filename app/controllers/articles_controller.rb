class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    respond_to do |format|
      if article.save
        flash[:alert] = "User was successfully created. Please log in."
        format.html { redirect_to articles_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: article }
      else
        format.html { render :new }
        format.json { render json: article.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to articles_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path }
      format.json { head :no_content }
    end
  end


  private
    def article_params
      params.require(:article).permit(:title, :content)
    end

end
