# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :movie_photos, dependent: :destroy
  belongs_to :category

  accepts_nested_attributes_for :movie_photos, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true
end
