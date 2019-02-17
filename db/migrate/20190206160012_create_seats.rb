class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :code, null: false
      t.references :cinema, foreign_key: true

      t.timestamps
    end
  end
end
