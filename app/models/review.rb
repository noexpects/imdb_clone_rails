# frozen_string_literal: true

class Review < ApplicationRecord
  after_commit :update_movie_rating

  belongs_to :user
  belongs_to :movie

  validates :score,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: Constants::Review::SCORE_MINIMUM_VALUE,
                            less_than_or_equal_to: Constants::Review::SCORE_MAXIMUM_VALUE }

  validates :user_id, uniqueness: { scope: :movie_id }

  def update_movie_rating
    movie.update_average_rating
  end
end
