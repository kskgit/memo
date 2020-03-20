class AddColumnHistoriesMemo < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :page_number, :integer, :after => "book_id"
    add_column :histories, :memo, :string, :after => "page_number"
  end
end
