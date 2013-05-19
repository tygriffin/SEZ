class Article < ActiveRecord::Base
  attr_accessible :author, :body, :description, :title, :image, :pubdate, :audio
  mount_uploader :image, ImageUploader
  has_many :vocabulary_words
end
