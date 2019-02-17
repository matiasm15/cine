class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :description, null: false

      t.timestamps
    end
  end
end
