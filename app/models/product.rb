class Product < ApplicationRecord
  validates :title, presence: true
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
end
