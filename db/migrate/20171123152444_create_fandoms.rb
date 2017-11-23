class CreateFandoms < ActiveRecord::Migration[5.1]
  def change
    create_table :fandoms do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
