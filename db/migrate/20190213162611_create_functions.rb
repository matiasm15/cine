class CreateFunctions < ActiveRecord::Migration[5.2]
  def change
    create_table :functions do |t|
      t.string :status, null: false

      t.datetime :started_for, null: false
      t.datetime :started_at
      t.datetime :finished_at

      t.references :cinema, foreign_key: true
      t.references :movie_version, foreign_key: true

      t.timestamps
    end
  end
end
