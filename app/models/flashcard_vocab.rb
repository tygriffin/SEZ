class FlashcardVocab < ActiveRecord::Base
  belongs_to :quiz
  validates_presence_of :word, :translation, :vocab_type, :quiz_id, :example_sentence
end
