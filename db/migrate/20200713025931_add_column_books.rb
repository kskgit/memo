class AddColumnBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :uid, :string, null: false, after: :id
    add_column :books, :artist_name, :string, after: :uid
    add_column :books, :title, :string, after: :artist_name
    add_column :books, :created_at, :datetime, after: :discarded_at
    add_column :books, :updated_at, :datetime, after: :created_at
    remove_column :books, :volume_id
  end
end
