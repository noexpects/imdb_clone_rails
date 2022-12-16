# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @pagy, @movies = pagy(MoviesQuery.call, items: Constants::Movie::MOVIES_AMOUNT)
  end
end
