require 'rails_helper'

# bundle exec rspec ./spec/requests/articles_spec.rb

RSpec.describe ArticlesController do
    describe '#index' do
        it 'returns a success response' do
            get '/articles'
            expect(response).to have_http_status(:ok)
        end

        it 'returns a proper json' do
            article = create :article
            get '/articles'

            aggregate_failures do
                expect(json_data.length).to eq(1)
                expected = json_data.first

                expect(expected[:id]).to eq(article.id.to_s)
                expect(expected[:type]).to eq('article')
                expect(expected[:attributes]).to eq(
                    title: article.title,
                    content: article.content,
                    slug: article.slug      
                )
            end
        end

        it 'returns articles in the proper order' do
            recent_article = create(:article)
            older_article = create(:article, created_at: 1.hour.ago)
            get '/articles'
            ids = json_data.map { |item| item[:id].to_i }

            expect(ids).to(eq([recent_article.id, older_article.id]))
        end

        it 'paginates results' do
            article1, article2, article3 = create_list(:article, 3)
            get '/articles', params: { page: { number: 2, size: 1 }}
            pp json_data.length
            expect(json_data.length).to eq(1)
            expect(json_data.first[:id]).to eq(article2.id)
        end

        it 'contains pagination links in the reponse' do
            article1, article2, article3 = create_list(:article, 3)
            get '/articles', params: { page: { number: 2, size: 1 }}

            expect(json['links']).to eq(5)
            expect(json['links'].keys).to eq(
                'first', 'prev', 'next', 'last', 'self'
            )
        end
    end
end