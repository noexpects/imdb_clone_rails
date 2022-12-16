# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { FFaker::Movie.title }
    description { FFaker::Book.description(10) }
    category

    image do
      Rack::Test::UploadedFile.new(Dir[Rails.root.join('spec/fixtures/files/images/valid_movie_images/*.*')].sample)
    end
  end
end
