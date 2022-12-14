# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    return redirect_to root_path unless current_movie

    @review = Review.create(user: current_user, movie: current_movie, **permitted_reviews_params.except(:movie))
    redirect_success if @review.save
  end

  private

  def permitted_reviews_params
    params_address_hash.permit(:score, :movie_id)
  end

  def params_address_hash
    params.require(:review)
  end

  def redirect_success
    respond_to do |format|
      format.html do
        redirect_to root_path, notice: I18n.t(:'movie_block.notices.review_created')
      end
      format.turbo_stream
    end
  end

  def current_movie
    @current_movie ||= Movie.find_by(id: permitted_reviews_params[:movie_id])
  end
end
