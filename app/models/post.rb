class Post < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :title, presence: true, length: { maximum: 50 }
  validates :rate, presence: true
  validates :content, length: { maximum: 300 }
  validates :user_id, uniqueness: { scope: [:product_id] }
end