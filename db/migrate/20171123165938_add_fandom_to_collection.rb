class AddFandomToCollection < ActiveRecord::Migration[5.1]
  def change
    add_reference :collections, :fandom, foreign_key: true
  end
end
