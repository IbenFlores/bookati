class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.string :phone_number
      t.float :earnings, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
