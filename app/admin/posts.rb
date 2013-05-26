ActiveAdmin.register Post do
  index do
    column :title do |item| eval"link_to item.title, admin_#{item.class.name.to_s.underscore}_path(item)" rescue nil end rescue nil
    column :body do |post|
      truncate(post.body, omision: "...", length: 200)
    end
    column :author
    column :created_at
    column :updated_at
  end
end
