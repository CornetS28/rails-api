class ArticleSerializer
  include JSONAPI::Serializer
  # set_types :articles
  attributes :title, :content, :slug
end
