class AddAncestryToPostComments < ActiveRecord::Migration[8.1]
  def change
    add_column :post_comments, :ancestry, :string, default: '/', null: false
    add_index :post_comments, :ancestry
  end
end
