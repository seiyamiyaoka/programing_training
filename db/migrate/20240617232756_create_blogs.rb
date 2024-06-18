class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title, default: "", null: false
      t.text :content, default: "", null: false
      t.integer :status, default: 0, null: false
      t.references :writer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
