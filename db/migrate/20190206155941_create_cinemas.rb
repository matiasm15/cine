class CreateCinemas < ActiveRecord::Migration[5.2]
  def change
    create_table :cinemas do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
