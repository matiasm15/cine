class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.datetime :release_date
      t.integer :duration

      t.references :genre, foreign_key: true
      t.references :language, foreign_key: true
      t.references :classification, foreign_key: true

      t.timestamps null: false
    end
  end
end
