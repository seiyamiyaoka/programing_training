class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content, default: "", null: false
      t.references :blog, null: false, foreign_key: true
      t.references :writer, null: false, foreign_key: true
      t.boolean :is_visible_author, default: false, null: false
      t.timestamps
    end
  end
end
