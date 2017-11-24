class CreateRecs < ActiveRecord::Migration[5.1]
  def change
    create_table :recs do |t|
      t.integer :fanwork_id
      t.integer :collection_id
      t.integer :position

      t.timestamps
    end

    add_index :recs, [:collection_id, :fanwork_id]
  end
end
