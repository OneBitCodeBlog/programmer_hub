class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  acts_as_commentable
end