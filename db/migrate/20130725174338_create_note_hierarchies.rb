class CreateNoteHierarchies < ActiveRecord::Migration
  def change
    create_table :note_hierarchies do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :note_hierarchies, [:ancestor_id, :descendant_id, :generations], :unique => true, :name => "note_anc_desc_udx"
    add_index :note_hierarchies, [:descendant_id], :name => "note_desc_idx"
  end
end
