class CreateFanworks < ActiveRecord::Migration[5.1]
  def change
    create_table :fanworks do |t|
      t.string :title
      t.references :fandom, foreign_key: true
      t.string :link
      t.text :comment
      t.text :review

      t.timestamps
    end
  end
end
