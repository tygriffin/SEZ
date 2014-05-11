class FlashcardVocab < ActiveRecord::Base

  belongs_to :quiz

  validates :word, :translation, :vocab_type, :quiz_id, :example_sentence, :presence => true

end
