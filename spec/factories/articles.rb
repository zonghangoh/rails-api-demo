# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'Sample article' }
    content { 'MyText' }
    slug { 'MyString' }
  end
end
