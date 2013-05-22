class Post < ActiveRecord::Base
  attr_accessible :author, :body, :title, :post_image
  mount_uploader :post_image, PostImageUploader
end
