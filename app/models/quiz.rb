class Quiz < ActiveRecord::Base

  belongs_to :article
  belongs_to :topic
  has_many :flashcard_vocabs

  validates_presence_of :name, :quiz_type
  validates :quiz_type, :inclusion => { :in => ['fill in the blank', 'flashcard'], :message => "%{value} is not a valid quiz type." }
end
