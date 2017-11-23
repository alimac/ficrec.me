class RemoveFandomFromCollections < ActiveRecord::Migration[5.1]
  def change
    remove_column :collections, :fandom, :string
  end
end
