require 'rails_helper'

# bundle exec rspec ./spec/requests/articles_spec.rb

RSpec.describe ArticlesController do
    describe '#index' do
        it 'returns a success response' do
            get '/articles'
            expect(response).to have_http_status(:ok)
        end

         it 'returns  a proper json' do
            article = create :article
            get '/articles'
            
            expect(json_data).to eq(
                 [
                    {
                        id: article.id.to_s,
                        type: 'article',
                        attributes: {
                            title: article.title,
                            content: article.content,
                            slug: article.slug
                        }
                    }
                ]
            )
        end
    end
end