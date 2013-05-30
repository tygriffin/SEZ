ActiveAdmin.register Article do
  index do
    selectable_column
    column :title do |item| eval"link_to item.title, admin_#{item.class.name.to_s.underscore}_path(item)" rescue nil end rescue nil
    column :description do |a|
      truncate(a.description, :omission => "...", :length => 150)
    end
    column :body do |a|
      truncate(a.body, :omission => "...", :length => 200)
    end
    column :author
    column :pubtype
    column :pubdate
    column :updated_at
  end

  show do |a|
    attributes_table do
      row :title
      row :description
      row :author
      row :pubdate
      row :pubtype
      row :body
      row :figure
      row :image
      row :audio
      row "Tags" do |t|
        a.tags.map(&:name).join(", ").html_safe
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "References" do
      f.input :title
      f.input :description
      f.input :author
      f.input :pubdate
      f.input :pubtype
    end
    f.inputs "Content" do
      f.input :body
    end
    f.inputs "Media" do
      f.input :figure
      f.input :image
      f.input :audio
    end
    f.inputs "Meta" do
      f.has_many :tags do |t|
        t.input :name
      end
    end
    f.actions
  end

end
