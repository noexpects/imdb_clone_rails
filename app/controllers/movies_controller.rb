# frozen_string_literal: true

class MoviesController < ApplicationController
  def show
    @movie = Movie.friendly.find_by(slug: params[:id])&.decorate

    redirect_to root_path unless @movie
  end
end
