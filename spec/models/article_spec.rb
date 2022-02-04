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

end
