# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do

  describe '#validations' do
    let(:article) { build(:article) }

    it 'tests article object' do
      # article = FactoryBot.create(:article)
      # article = create(:article)

      expect(article).to be_valid # article.valid? == true
      expect(article.title).to eq('Sample article')
    end

    it 'has an invalid title' do
      article = build(:article, title: '')
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'has invalid content' do
      article = build(:article, content: '')
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'has invalid slug' do
      article = build(:article, slug: '')
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end
  end

  describe '.recent' do
    it 'returns articles in the proper order' do
      older_article = create(:article, created_at: 1.hour.ago)
      recent_article = create(:article)

      expect(described_class.recent).to eq([recent_article, older_article])

      # recent_article.update_column(:created_at, 2.hours.ago)
      older_article.touch(:created_at)
      expect(described_class.recent).to eq([older_article, recent_article])
    end
  end
end
