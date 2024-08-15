class DeletePostLikesThatViolateUniqueness < ActiveRecord::Migration[7.1]
  def change
    duplicates = PostLike
      .group(:user_id, :post_id)
      .having('COUNT(*) > 1')
      .pluck(:user_id, :post_id)

    duplicates.each do |user_id, post_id|
      PostLike.where(user_id: user_id, post_id: post_id).offset(1).destroy_all
    end
  end
end
