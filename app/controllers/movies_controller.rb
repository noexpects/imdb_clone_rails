# frozen_string_literal: true

class MoviesController < ApplicationController
  MOVIES_AMOUNT = 8

  helper_method :books_total_count

  def show
    @movie = Movie.find_by(id: params[:id])&.decorate

    redirect_to movies_path unless @movie
  end

  def index
    @presenter = BooksPresenter.new(params)
    @pagy, @movies = pagy(CatalogBooksQuery.call(category: @presenter.current_category, sorting: @presenter.sorting),
                         items: MOVIES_AMOUNT)
  end
end

