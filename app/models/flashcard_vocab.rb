class FlashcardVocab < ActiveRecord::Base
  #attr_accessible :example_sentence, :quiz_id, :translation, :vocab_type, :word

  belongs_to :quiz

  validates_presence_of :word, :translation, :vocab_type, :quiz_id, :example_sentence
end
