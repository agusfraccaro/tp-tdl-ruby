class Recipe < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :comments,  dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  validates :nombre, presence: true, length: {minimum: 4, maximum: 20}
  validates :content, presence: true, length: {minimum: 10, maximum: 500}
  validates :image, presence: true
end
