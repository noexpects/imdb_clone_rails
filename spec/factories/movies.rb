# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { FFaker::Movie.title }
    description { FFaker::Book.description(10) }
    category

    after :build do |movie|
      FactoryBot.create(:movie_photo, movie: movie)
    end
  end
end
