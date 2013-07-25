class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :parent_id
      t.string :creator

      t.timestamps
    end
  end
end
