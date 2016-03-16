class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	
	def show
		@article = Article.find(params[:id])
	end

	def new 
	end

	def create
		@article = Article.new(params.require(:article).permit(:title, :text))

		if @article.save
			redirect_to articles_path, :notice => "Your Post is posted"
		else
			render "new"
		end
	end

	def edit
		@article = Article.find(params[:id])

	end

	def update
		@article = Article.find(params[:id])

		if @post.update_attributes(params.require(:article).permit(:title, :text))
			redirect_to articles_path

		else
			render "edit"
		end

	end

	def destory
		@article = Article.find(params[:id])
		@article.destory
		redirect_to articles_path

	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
