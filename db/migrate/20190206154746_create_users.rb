class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :name
      t.string :username, unique: true
      t.string :password_hash, null: false
      t.string :token, null: false, unique: true

      t.datetime :birthdate

      t.timestamps
    end
  end
end
