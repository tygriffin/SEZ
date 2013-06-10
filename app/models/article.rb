class Article < ActiveRecord::Base
  attr_accessible :author, :body, :description, :title, :image, :image_attribution, :pubdate, :audio, :pubtype, :figure, :tags_attributes, :topic_id

  mount_uploader :image, ImageUploader

  belongs_to :topic
  has_many :vocabulary_words
  has_many :culture_notes
  has_many :tags

  validates_presence_of :author, :body, :description, :title, :pubdate, :pubtype
  validates :pubtype, :inclusion => { :in => %w(feature blog recipe), :message => "%{value} is not a valid publication type. Please type 'article' or 'blog'." }

  accepts_nested_attributes_for :tags, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }


end
