class Recipe < ApplicationRecord
  has_rich_text :content
  belongs_to :user, dependent: :destroy
  has_many :comments
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables
  has_one_attached :image
  validates :nombre, presence: true, length: {minimum: 4, maximum: 20}
  validates :content, presence: true, length: {minimum: 10, maximum: 500}
  validates :image, presence: true
end
