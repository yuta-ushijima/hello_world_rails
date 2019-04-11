class AddPoststatusToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :post_status, :integer, null: false, default: 0
    add_index :articles, :post_status
  end
end
