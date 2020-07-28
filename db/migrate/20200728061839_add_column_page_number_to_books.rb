class AddColumnPageNumberToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :page_number, :integer, after: :is_readed, default: 0
  end
end
