# frozen_string_literal: true

FactoryBot.define do
  factory :movie_photo do
    image { Rack::Test::UploadedFile.new('spec/fixtures/files/images/valid.png') }
  end
end
