# frozen_string_literal: true

class MovieImageUploader < ApplicationUploader
  process resize_to_fit: [1024, 800]

  # Create different versions of your uploaded files:
  version :tiny do
    process resize_to_fill: [100, 100]
  end

  version :small do
    process resize_to_fill: [156, 250]
  end

  version :medium do
    process resize_to_fill: [250, 400]
  end

  version :large do
    process resize_to_fill: [360, 520]
  end

  # An allowlist of extensions which are allowed to be uploaded.
  def extension_allowlist
    %w[jpg jpeg png]
  end
end
