ActiveAdmin.register Article do
  index do
    selectable_column
    column :title do |item| eval"link_to item.title, admin_#{item.class.name.to_s.underscore}_path(item)" rescue nil end rescue nil
    column :description do |article|
      truncate(article.description, :omission => "...", :length => 150)
    end
    column :body do |article|
      truncate(article.body, :omission => "...", :length => 200)
    end
    column :author
    column :pubdate
    column :updated_at
  end
end
