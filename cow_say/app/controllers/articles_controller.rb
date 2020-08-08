class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
 
    def index
        @logger = Logger.new(STDOUT)
        @logger.info('[start] index entry')
        @articles = Article.all
        @logger.info('[end] articles: ' + @articles.size.to_s)
        @logger.info('[end] index entry')
    end

    def new
    end

    def edit
        @logger = Logger.new(STDOUT)
        @logger.info('[start] edit entry')
        @article = Article.find(params[:id])
        @logger.info('[edit] Article.find() call')

        @logger.info('[params] ' + params.to_s)

        if (params.has_key?(:title) && params.has_key?(:text) && @article.update(article_params))
            @logger.info('[edit] Article redirect_to')
            redirect_to @article
        else
            @logger.info('[edit] Article render')
            render 'edit'
        end
        @logger.info('[stop] edit entry')
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def create
        # render plain: params[:article].inspect
        @article = Article.new(article_params)

        @logger = Logger.new(STDOUT)
        @logger.info('[params] ' + params.to_s)

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
       
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
