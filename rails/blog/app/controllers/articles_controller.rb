class ArticlesController < ApplicationController

	def new	
	end

	def create
		@articles = Article.new(articles_params)

		@articles.save

		redirect_to @articles
	end


	def articles_params
		params.require(:articles).permit(:title, :text)
	end 	

	def show
		@articles = Article.find(params[:id])
	end
	
	def index
  		@articles = Article.all
	end

end
