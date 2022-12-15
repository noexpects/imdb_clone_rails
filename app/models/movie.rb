# frozen_string_literal: true

class Movie < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :reviews, dependent: :destroy
  has_many :movie_photos, dependent: :destroy
  belongs_to :category

  accepts_nested_attributes_for :movie_photos, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true

  def update_average_rating
    @ratings = reviews.collect(&:score)

    @ratings.empty? ? update(rating: 0) : update(rating: @ratings.sum / @ratings.size)
  end
end
