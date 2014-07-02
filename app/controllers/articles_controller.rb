class ArticlesController < ApplicationController
	 include ArticlesHelper
   before_action :set_article, only: [:show, :edit, :update, :destroy]


 def index
 	@article = Article.all
 end

 def show
 @article = Article.find(params[:id])
end

 def new
 	@article = Article.new


end


  def create
    @article = Article.new(article_params)

    @article.save

    redirect_to article_path(@article)
  end




  def destroy
    @article = Article.find(params[:id])

    @article.destroy

    redirect_to articles_path
  end

  def edit
   @article = Article.find(params[:id])

  end

  def update
  	
if @article.update(article_params)
      flash[:notice] = "Article updated."
      redirect_to @article
    else
      flash[:alert] = "There was a problem. Please try again."
      redirect_to article_path(@article)
    end
  end

   
private

  def article_params
    params.require(:article).permit(:body)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
