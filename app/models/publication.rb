class Publication < ActiveRecord::Base
  attr_accessible :author, :body, :description, :title, :image, :pubdate, :audio, :pubtype, :figure, :tags_attributes

  mount_uploader :image, ImageUploader

  has_many :vocabulary_words
  has_many :culture_notes
  has_many :tags

  validates_presence_of :author, :body, :description, :title, :pubdate, :pubtype
  validates :pubtype, :inclusion => { :in => %w(article blog), :message => "%{value} is not a valid publication type. Please type 'article' or 'blog'." }

  accepts_nested_attributes_for :tags, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }


end
