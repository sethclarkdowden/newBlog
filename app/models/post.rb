class Post < ActiveRecord::Base
   attr_accessible :title, :body, :author, :img
   has_many :comments
   has_attached_file :img, :styles => { :medium => "600x400>", :thumb => "300x200>" }
end
