# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :movies, dependent: :nullify

  validates :name, presence: true
end
