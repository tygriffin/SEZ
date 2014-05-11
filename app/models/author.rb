class Author < ActiveRecord::Base
  #attr_accessible :bio, :image, :name, :website
  mount_uploader :image, AuthorImageUploader

  validates_presence_of :name

  has_many :articles
end
