class Post < ActiveRecord::Base
  attr_accessible :author, :body, :title, :image
  mount_uploader :image, ImageUploader
end
