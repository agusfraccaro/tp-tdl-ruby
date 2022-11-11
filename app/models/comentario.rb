class Comentario < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :body, presence: true, length: {minimum: 10, maximum: 500}
end
