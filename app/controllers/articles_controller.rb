
class ArticlesController < ApplicationController
 
http_basic_authenticate_with name: "lab2023", password: "lab2023", except: [:index, :show]
before_action :set_article, only: [:show, :edit, :update, :destroy]


def index
	@articles = Article.all
end


def show
  
end
 
def new
	@article = Article.new
end

def edit

end

def create
	@article = Article.new(article_params)
 
 
	if @article.save
    	redirect_to @article
	else
    	render 'new'
end	
end


def update

 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
 

def destroy
	
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end


private
 def set_article
      @article = Article.find(params[:id])
    end

def article_params
    params.require(:article).permit(:title, :text)
end




end