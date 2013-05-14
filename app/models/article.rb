class Article < ActiveRecord::Base
  attr_accessible :author, :body, :description, :title, :image, :pubdate
  mount_uploader :image, ImageUploader
  has_many :vocabulary_words
end
