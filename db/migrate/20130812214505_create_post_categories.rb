class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.string :post_id
      t.string :category_id
      t.timestamps
    end
  end
end
