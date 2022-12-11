class CreateMoviePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_photos do |t|
      t.text :image_data, null: false
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
