# frozen_string_literal: true

class AddUserToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :user, foreign_key: true
  end
end
