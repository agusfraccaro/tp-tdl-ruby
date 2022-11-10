class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :nombre, presence: true, length: {minimum: 4, maximum: 20}
  validates :descripcion, presence: true, length: {minimum: 10, maximum: 500}
  validates :image, presence: true
end
