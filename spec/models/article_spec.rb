require 'rails_helper'

# bundle exec rspec ./spec/models/article_spec.rb

RSpec.describe Article, type: :model do
  describe 'validation tests' do
    # it 'creates a article' do
    #   expect(subject.save).to be_truthy
    # end

    # it 'tests that article is valid' do
    #   expect(subject).to be_valid
    # end 

    it 'validates title presence' do
      subject.title = ''
      expect(subject).not_to be_valid
      expect(subject.errors[:title]).to include("can't be blank")
    end

    it 'validates slug presence' do
      subject.slug = ''
      expect(subject).not_to be_valid
      expect(subject.errors[:slug]).to include("can't be blank")
    end


    # article = build :article, slug: ''
    #   expect(article).not_to be_valid
    #   expect(article.errors.messages[:slug]).to include("can't be blank")
    

    # it 'validates slug not unique' do
    #   before { subject.create!(name: 'foo', email: 'john@home.xyz') }
    #     expect(subject).to be_invalid
    #     expect(subject.errors[:slug]).to include("has already been taken")
    # end

    # it 'validates slug unique' do
    #   before { subject.create!(name: 'foo', email: 'jane@home.xyz') }
    #     expect(subject).to be_valid
        
    # end
  end
end
