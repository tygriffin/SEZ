ActiveAdmin.register CultureNote do
  index do
    column :title do |item| eval"link_to item.title, admin_#{item.class.name.to_s.underscore}_path(item)" rescue nil end rescue nil
    column :body
    column :instance
    default_actions
  end
end
