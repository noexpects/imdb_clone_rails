# frozen_string_literal: true

class ApplicationUploader < Shrine
  plugin :activerecord
  plugin :cached_attachment_data # for retaining the cached file across form redisplays
  plugin :restore_cached_data # re-extract metadata when attaching a cached file
  plugin :validation
  plugin :validation_helpers
  plugin :determine_mime_type, analyzer: :marcel
  plugin :pretty_location
  plugin :derivatives, create_on_promote: true
end

