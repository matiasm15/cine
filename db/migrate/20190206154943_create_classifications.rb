class CreateClassifications < ActiveRecord::Migration[5.2]
  def change
    create_table :classifications do |t|
      t.string :code, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
