# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'Sample article' }
    content { 'MyText' }
    sequence(:slug) { |n| "article#{n}" }
  end
end
