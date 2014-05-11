class Author < ActiveRecord::Base

  mount_uploader :image, AuthorImageUploader

  validates :name, :presence => true

  has_many :articles

end
