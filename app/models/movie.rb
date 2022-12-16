# frozen_string_literal: true

class Movie < ApplicationRecord
  mount_uploader :image, MovieImageUploader

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :reviews, dependent: :destroy

  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true

  def update_average_rating
    @ratings = reviews.collect(&:score)

    @ratings.empty? ? update(rating: 0) : update(rating: @ratings.sum / @ratings.size)
  end
end
