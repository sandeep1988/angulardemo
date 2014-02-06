class Post < ActiveRecord::Base
  attr_accessible :author, :contents, :post_date, :title
end
