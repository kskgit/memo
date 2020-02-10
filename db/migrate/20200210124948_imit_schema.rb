class ImitSchema < ActiveRecord::Migration[5.2]
  def change
    create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
      t.string "last_name", null: false
      t.string "first_name", null: false
      t.string "mail", null: false
      t.string "pass_word", null: false
      t.datetime "discarded_at"
    end
    create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
      t.string "project_name", null: false
      t.datetime "discarded_at"
    end
    create_table "project_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
      t.integer "project_id", null: false
      t.integer "user_id", null: false
      t.datetime "discarded_at"
    end
    create_table "memos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
      t.integer "project_id", null: false
      t.integer "post_user_id", null: false
      t.string "memo", null: false
      t.datetime "post_date", null: false
      t.datetime "discarded_at"
    end
    create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
      t.integer "memo_id", null: false
      t.integer "tagu", null: false
      t.datetime "discarded_at"
    end
    create_table "attendees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
      t.integer "memo_id", null: false
      t.integer "user_id", null: false
      t.datetime "discarded_at"
    end
  end
end


