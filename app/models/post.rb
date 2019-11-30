class Post < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :title, presence: true, length: { maximum: 50 }
  validates :rete, presence: true
end
