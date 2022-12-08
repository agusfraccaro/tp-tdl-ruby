class Recipe < ApplicationRecord
  has_rich_text :content
  has_one :action_text_rich_text, class_name: 'ActionText::RichText', as: :record
  belongs_to :user
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables
  has_many :comments,  dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  validates :nombre, presence: true, length: {minimum: 4, maximum: 256}
  validates :content, presence: true, length: {minimum: 10, maximum: 2000}
  validates :image, presence: true
end
