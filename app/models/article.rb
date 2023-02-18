class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  # belongs_to :category
  # has_many :comments, dependent: :destroy


  validates :body, :article_name, :category_id, :user_id, presence: true
  validates :likes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
