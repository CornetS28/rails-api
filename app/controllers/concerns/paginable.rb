module Paginable
    extend ActiveSupport::Concern

    def paginate(collection)
        paginator.call(
            collection,
            params: paginations_params,
            base_url: request.url
        )
    end

    def paginator
        JSOM::Pagination::Paginator.new
    end

    def paginations_params
        params.permit![:page]
    end

    def render_collection(paginated)
        options = { 
            meta: paginated.meta.to_h, 
            links: paginated.links.to_h 
        }
        result = serializer.new(paginated.items, options)
        render json: result, status: :ok
    end

end