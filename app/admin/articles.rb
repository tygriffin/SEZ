ActiveAdmin.register Article do
  index do
    selectable_column
    column :title
    column :description
    column :author
    column :pubdate
    default_actions
  end
end
