# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :movies, dependent: :nullify

  validates :name, presence: true
end
