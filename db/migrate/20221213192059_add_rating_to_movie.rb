# frozen_string_literal: true

class AddRatingToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :rating, :decimal, precision: 3, scale: 1, default: 0
  end
end
