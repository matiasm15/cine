class CreateMovieVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_versions do |t|
      t.string :title, null: false

      t.references :language, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps null: false
    end
  end
end
