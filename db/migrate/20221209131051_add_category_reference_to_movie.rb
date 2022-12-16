# frozen_string_literal: true

class AddCategoryReferenceToMovie < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :category, foreign_key: true
  end
end
