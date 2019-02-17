class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :code, null: false, unique: true
      t.string :description

      t.timestamps
    end
  end
end
