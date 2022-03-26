class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :published_at
      # t.references :category
      t.integer :category_id
      t.integer :author_id

      t.timestamps
    end
  end
end
