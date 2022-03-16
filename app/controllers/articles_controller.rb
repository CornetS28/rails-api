class ArticlesController < ActionController::API
    def index
        articles = Article.all
        render json: serializer.new(articles), status: :ok
    end
    def serializer
        ArticleSerializer
    end
end