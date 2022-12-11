# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :score, null: false, default: 0

      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      
      t.timestamps
    end
  end
end
