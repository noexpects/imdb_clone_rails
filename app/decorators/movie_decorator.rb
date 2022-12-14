# frozen_string_literal: true

class MovieDecorator < ApplicationDecorator
  delegate_all

  def long_description?
    description.length > Constants::Movie::MAX_DESCRIPTION_LENGTH
  end

  def short_description
    description[...Constants::Movie::SHORT_DESCRIPTION_LENGTH ]
  end
  
  def reviewed_by_user?(user:)
    reviews.exists?(user: user)
  end
end
