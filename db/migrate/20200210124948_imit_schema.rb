class ImitSchema < ActiveRecord::Migration[5.2]
  def change
    create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
      t.string "last_name", null: false
      t.string "first_name", null: false
      t.string "mail", null: false
      t.string "pass_word", null: false
      t.datetime "discarded_at"
    end
  end
end


