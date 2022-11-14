class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :recipe, dependent: :destroy
  has_rich_text :content
end
