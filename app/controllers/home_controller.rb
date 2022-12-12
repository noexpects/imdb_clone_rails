# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @pagy, @movies = pagy(Movie.all, items: Constants::Movie::MOVIES_AMOUNT)
  end
end

