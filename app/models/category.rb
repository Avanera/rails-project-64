# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: nil

  validates :name, length: { in: 2..100 }
end
