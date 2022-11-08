class Receta < ApplicationRecord
  belongs_to :user
  validates :nombre, presence: true, uniqueness: true, length: {minimum: 4, maximum: 15}
  validates :descripcion, presence: true, length: {minimum: 10, maximum: 500} 
end
