# frozen_string_literal: true

class ImageUploader < ApplicationUploader
  MAX_SIZE = 5
  MIME_TYPES = %w[image/jpeg image/png image/jpg].freeze
  EXTENSIONS = %w[jpg jpeg png].freeze

  Attacher.validate do
    validate_max_size MAX_SIZE * 1024 * 1024
    validate_mime_type MIME_TYPES
    validate_extension EXTENSIONS
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      tiny: magick.resize_to_limit!(100, 100),
      small: magick.resize_to_limit!(156, 250),
      medium: magick.resize_to_limit!(250, 400)
    }
  end
end
