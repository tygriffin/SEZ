class Author < ActiveRecord::Base

  mount_uploader :image, AuthorImageUploader

  validates_presence_of :name

  has_many :articles
end
