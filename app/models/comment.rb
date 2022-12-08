class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_rich_text :content
  validates :content, presence: true, length: {minimum:3, maximum:200}
end
