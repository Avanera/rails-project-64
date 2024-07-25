# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: nil
end
