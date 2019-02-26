class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :status, null: false
      t.datetime :reserved_at
      t.datetime :closed_at

      t.references :function, foreign_key: true
      t.references :seat, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
