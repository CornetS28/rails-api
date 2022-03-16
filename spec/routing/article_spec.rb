require 'rails_helper'

# bundle exec rspec ./spec/routing/article_spec.rb 

RSpec.describe '/articles routes' do
    it 'routes to articles#index' do
        expect(get 'articles').to route_to('articles#index')
    end
end