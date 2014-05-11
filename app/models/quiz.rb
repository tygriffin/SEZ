class Quiz < ActiveRecord::Base

  belongs_to :article
  belongs_to :topic
  has_many   :flashcard_vocabs

  validates :name, :quiz_type, :presence => true
  validates :quiz_type, :inclusion => {
                                        :in => ['fill in the blank', 'flashcard'],
                                        :message => "%{value} is not a valid quiz type."
                                      }

end
