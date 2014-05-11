class VocabularyWord < ActiveRecord::Base
  #attr_accessible :article_id, :definition, :part_of_speech, :translation, :word, :instance
  belongs_to :article
end
