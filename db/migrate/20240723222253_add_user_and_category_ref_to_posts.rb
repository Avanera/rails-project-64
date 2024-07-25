class AddUserAndCategoryRefToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :creator, foreign_key: { to_table: :users }
    add_reference :posts, :category, foreign_key: true
  end
end
