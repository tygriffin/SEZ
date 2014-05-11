ActiveAdmin.register VocabularyWord do
  permit_params :article_id, :definition, :part_of_speech, :translation, :word, :instance

  index do
    selectable_column
    column :word do |item| eval"link_to item.word, admin_#{item.class.name.to_s.underscore}_path(item)" rescue nil end rescue nil
    column :definition
    column :translation
    column :part_of_speech
    column :article_id
    column :updated_at
    default_actions
  end
end
