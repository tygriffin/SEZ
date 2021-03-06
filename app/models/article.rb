class Article < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, :use => [:slugged, :history]

  mount_uploader :image, ImageUploader

  belongs_to :topic
  belongs_to :author
  has_many   :vocabulary_words
  has_many   :culture_notes
  has_many   :study_notes
  has_many   :tags
  has_many   :quizzes

  validates :author, :body, :description, :title, :pubdate, :pubtype, :presence => true
  validates :pubtype,
            :inclusion => {
                            :in => ['feature', 'blog', 'recipe'],
                            :message => "%{value} is not a valid publication type. Please use 'article', 'recipe' or 'blog'."
                          }
  validates :flag_message,
            :inclusion => {
                            :in => ['easy to read', 'short read', 'challenge', 'learn slang'],
                            :message => "%{value} is not a valid flag message.",
                            :allow_blank => true
                          }

  accepts_nested_attributes_for :tags,
                                :allow_destroy => true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

end
