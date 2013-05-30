ActiveAdmin.register VocabularyWord do
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
