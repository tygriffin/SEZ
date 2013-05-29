class VocabularyWord < ActiveRecord::Base
  attr_accessible :publication_id, :definition, :part_of_speech, :translation, :word, :instance
  belongs_to :publication
end
