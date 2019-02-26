class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :name
      t.string :encrypted_password, null: false

      t.datetime :birthdate

      t.timestamps null: false
    end
  end
end
