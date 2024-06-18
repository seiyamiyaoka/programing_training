class CreateWriters < ActiveRecord::Migration[6.1]
  def change
    create_table :writers do |t|
      t.string :name, default: "", null: false
      t.string :email, default: "", null: false
      t.integer :genre , default: 0, null: false
      t.timestamps
    end
  end
end
