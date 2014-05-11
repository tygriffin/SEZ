ActiveAdmin.register CultureNote do
  permit_params :article_id, :body, :instance, :title

  index do
    column :title do |item| eval"link_to item.title, admin_#{item.class.name.to_s.underscore}_path(item)" rescue nil end rescue nil
    column :body
    column :instance
    column :article_id
    default_actions
  end
end
