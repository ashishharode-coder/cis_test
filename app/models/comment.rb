class Comment < ApplicationRecord
  has_rich_text :content

  belongs_to :user, optional: true
  belongs_to :post, optional: true
  has_many :replies, class_name: "Comment", foreign_key: "main_comment_id"

  belongs_to :main_comment, class_name: "Comment", optional: true

  has_one :guest

  attr_accessor :guest_name
end
