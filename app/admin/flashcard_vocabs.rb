ActiveAdmin.register FlashcardVocab do
  permit_params :example_sentence, :quiz_id, :translation, :vocab_type, :word
end
