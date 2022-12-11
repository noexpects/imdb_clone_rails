# frozen_string_literal: true

class MoviePhoto < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :movie

  validates :image_data, presence: true
end
