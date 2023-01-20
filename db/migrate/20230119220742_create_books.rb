class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :author, null: false
      t.float :price, default: 0.0
      t.references :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
