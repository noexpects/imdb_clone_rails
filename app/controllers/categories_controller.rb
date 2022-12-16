# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @category = Category.friendly.find_by(slug: params[:id])
    @pagy, @movies = pagy(CategoryMoviesQuery.call(category: @category), items: Constants::Movie::MOVIES_AMOUNT)

    redirect_to root_path unless @category
  end
end
