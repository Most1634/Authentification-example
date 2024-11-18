class ArticlesController < ApplicationController
def new
    @article = Article.new
end

def create
  @article = Article.new(article_params)
  if @article.save
        redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

def show
  @article = Article.find(params[:id])
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to root_path, status: :see_other
end




private
def article_params
    params.require(:article).permit(:name, :price, :description, :image, :status)
end
end
