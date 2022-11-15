class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :recipe_id }
  belongs_to :user
  belongs_to :recipe
end
