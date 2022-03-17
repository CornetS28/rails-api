require 'rails_helper'

# bundle exec rspec ./spec/models/article_spec.rb

RSpec.describe Article, type: :model do
  describe '#validations' do
    it 'should test that the factory is valid' do
      expect(build :article).to be_valid
    end

    # it 'validates title presence' do
    #   subject.title = ''
    #   expect(subject).not_to be_valid
    #   expect(subject.errors[:title]).to include("can't be blank")
    # end

    it 'should validate the presence of the title' do
      article = build :article, title: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:title]).to include("can't be blank")
    end

    # it 'validates slug presence' do
    #   subject.slug = ''
    #   expect(subject).not_to be_valid
    #   expect(subject.errors[:slug]).to include("can't be blank")
    # end

    it 'should validate the presence of the slug' do
      article = build :article, slug: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:slug]).to include("can't be blank")
    end

    it 'should validate the presence of the content' do
      article = build :article, content: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:content]).to include("can't be blank")
    end

    it 'should validate uniqueness of the slug' do
      article = create :article
      invalid_article = build :article, slug: article.slug
      expect(invalid_article).not_to be_valid
    end
  end

  describe '.recent' do
    it 'should list recent article first' do
      recent_article = create(:article)
      older_article = create(:article, created_at: 1.hour.ago)
     
      expect(described_class.recent).to eq(
        [ recent_article, older_article ]
      )

      recent_article.update_column(:created_at, 2.hours.ago)

      expect(described_class.recent).to eq(
        [ older_article, recent_article ]
      )


    end
  end
end
