class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.text :body
      t.string :article_name
      t.integer :category_id
      t.references :user, null: false, foreign_key: true
      t.string :image
      t.integer :likes

      t.timestamps
    end
  end
end
