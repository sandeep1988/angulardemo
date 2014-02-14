class Post < ActiveRecord::Base
  attr_accessible :author, :contents, :post_date, :title
  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :contents, presence: true
  validates :author, presence: true, length: { minimum: 1, maximum: 50 }end
