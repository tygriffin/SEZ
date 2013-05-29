ActiveAdmin.register Publication do
  index do
    selectable_column
    column :title do |item| eval"link_to item.title, admin_#{item.class.name.to_s.underscore}_path(item)" rescue nil end rescue nil
    column :description do |pub|
      truncate(pub.description, :omission => "...", :length => 150)
    end
    column :body do |pub|
      truncate(pub.body, :omission => "...", :length => 200)
    end
    column :author
    column :pubtype
    column :pubdate
    column :updated_at
  end
end
