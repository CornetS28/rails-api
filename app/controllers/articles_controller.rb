class ArticlesController < ActionController::API
    include Paginable
    include JsonapiErrorsHandler
    rescue_from ::StandardError, with: lambda { |e| handle_error(e) }
    
    def index
        paginated = paginate(Article.recent)
        render_collection(paginated)
    end

    def show
        article = Article.find(params[:id])
        render json: serializer.new(article)
    end

    def serializer
        ArticleSerializer
    end

end