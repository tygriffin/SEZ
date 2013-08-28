class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  attr_accessible :author, :body, :description, :title, :image, :image_attribution, :pubdate, :audio, :pubtype, :figure, :tags_attributes, :topic_id, :author_id, :slug, :flag_message

  mount_uploader :image, ImageUploader

  belongs_to :topic
  belongs_to :author
  has_many :vocabulary_words
  has_many :culture_notes
  has_many :study_notes
  has_many :tags
  has_many :quizzes

  validates_presence_of :author, :body, :description, :title, :pubdate, :pubtype
  validates :pubtype, :inclusion => { :in => %w(feature blog recipe), :message => "%{value} is not a valid publication type. Please type 'article' or 'blog'." }
  validates :flag_message, :inclusion => { :in => ['easy to read', 'short read', 'challenge', 'learn slang'], :allow_blank => true, :message => "%{value} is not a valid flag message." }

  accepts_nested_attributes_for :tags, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }


end
