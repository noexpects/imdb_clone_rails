# frozen_string_literal: true

class CategoryMoviesQuery
  def self.call(category:)
    category.present? ? MoviesQuery.call.where(category: category) : MoviesQuery.call
  end
end
