class AddUniqueIndexToPostLikes < ActiveRecord::Migration[7.1]
  def change
    add_index :post_likes, [:user_id, :post_id], unique: true
  end
end
