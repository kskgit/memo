class RenameColumnArtist < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :artist_name, :author
  end
end
