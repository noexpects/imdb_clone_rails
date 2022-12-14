# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = [Category.create(name: 'Horror'),
              Category.create(name: 'Comedy'),
              Category.create(name: 'Music'),
              Category.create(name: 'History'),
              Category.create(name: 'Drama')]

unless Movie.exists?
  50.times do
    FactoryBot.create(:movie, category: categories.sample)
  end
end
