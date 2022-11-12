class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_rich_text :content
end
