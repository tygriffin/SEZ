ActiveAdmin.register Quiz do
  permit_params :article_id, :description, :name, :quiz_type, :topic_id
end
