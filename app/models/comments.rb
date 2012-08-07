class Comments < ActiveRecord::Base
  attr_accessible :author_name, :body
  belongs_to :post
end
