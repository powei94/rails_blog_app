class ArticlesController < ApplicationController
    include ArticlesHelper
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        
        @comment = Comment.new
        @comment.article_id = @article.id
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save

        flash.notice = "El artículo \"#{@article.title}\" fue creado!"

        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])

        flash.notice = "El artículo \"#{@article.title}\" fue eliminado!"

        @article.destroy

        redirect_to articles_path()
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "El artículo \"#{@article.title}\" fue actualizado!"

        redirect_to article_path(@article)
    end
end
