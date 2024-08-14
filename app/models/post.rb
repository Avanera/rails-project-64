# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: 'posts'
  belongs_to :category
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :post_likes, dependent: :destroy

  validates :title, length: { in: 5..255 }
  validates :body, length: { in: 200..4000 }
end
