# frozen_string_literal: true

class MoviesQuery
  def self.call
    Movie.order('created_at desc')
  end
end
