class DropTablenameposts < ActiveRecord::Migration[7.0]
  def change
    drop_table :posts do |t|
      t.string "name"
      t.string "title"
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
