# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController do
  describe '#show' do
    it 'returns a success response' do
      article = create :article
      get "/articles/#{article.id}"
      expect(response).to have_http_status(:ok)
    end

    it 'returns a proper JSON' do
      article = create :article
      get "/articles/#{article.id}"
      expect(json_s[:id]).to eq(article.id)
      expect(json_s[:title]).to eq(article.title)
      expect(json_s[:content]).to eq(article.content)
      expect(json_s[:slug]).to eq(article.slug)
    end
  end

  describe '#index' do
    it 'returns a success response' do
      get '/articles'
      # expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
    end

    it 'returns a proper JSON' do
      article = create :article
      get '/articles'
      expect(json.length).to eq(1)
      expected = json.first.deep_symbolize_keys
      expect(expected[:id]).to eq(article.id)
      expect(expected[:title]).to eq(article.title)
      expect(expected[:content]).to eq(article.content)
      expect(expected[:slug]).to eq(article.slug)
    end

    it 'returns articles in the proper order' do
      older_article = create(:article, created_at: 1.hour.ago)
      recent_article = create(:article)
      get '/articles'
      ids = json.map { |item| item['id'].to_i }
      expect(ids).to(
        eq([recent_article.id, older_article.id])
      )
    end

    it 'paginates results' do
      article1, article2, article3 = create_list(:article, 3)
      get '/articles', params: { page: 2, per_page: 1 }
      expect(json.length).to eq(1)
      expect(json.first['id']).to eq(article2.id)
    end
  end
end
