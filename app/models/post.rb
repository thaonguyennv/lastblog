class Post < ApplicationRecord
  belongs_to :category
  validates :title, :content, :category_id, presence: true
  has_many :line_items
end
