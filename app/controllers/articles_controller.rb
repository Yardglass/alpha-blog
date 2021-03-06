class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		if @article.save
			redirect_to article_path(@article)
			flash[:success] = 'Article was created succesfully'
		else
			render :new
		end
	end

	def show
	end

	def update
		if @article.update(article_params)
			flash[:success] = 'Article was updated succesfully'
			redirect_to article_path(@article)
		else
			render :edit
		end
	end 	 

	def index
		@articles = Article.all
	end

	def destroy
		if @article.delete
			flash[:danger] = 'Article was deleted succesfully'
			redirect_to articles_path
		else
			render :index
		end
	end

	private

		def article_params
			params.require(:article).permit(:title, :description)
		end

		def set_article
			@article = Article.find(params[:id])
		end

end