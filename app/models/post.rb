class Post < ApplicationRecord
  has_rich_text :text
  belongs_to :user
  has_many :comments

  # all the private posts
  scope :pri, -> { where(is_private: true) }

  #all the public posts
  scope :pub, -> { where(is_private: false) }
end
