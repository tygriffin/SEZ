ActiveAdmin.register Article do

  permit_params :author_id, :body, :description, :title, :image, :image_attribution, :pubdate, :audio, :pubtype, :figure, :tags_attributes, :topic_id, :slug, :flag_message

  index do
    selectable_column
    column :title do |item| eval"link_to item.title, admin_#{item.class.name.to_s.underscore}_path(item)" rescue nil end rescue nil
    column :description do |a|
      truncate(a.description, :omission => "...", :length => 150)
    end
    column :body do |a|
      truncate(a.body, :omission => "...", :length => 200)
    end
    column :author_id, :collection => Author.all.map{|u| ["#{u.name}", u.id]}
    column :pubtype
    column :pubdate
    column :updated_at
    default_actions
  end

  show do |a|
    attributes_table do
      row :title
      row :description
      row :topic
      row :author_id, :collection => Author.all.map{|u| ["#{u.name}", u.id]}
      row :pubdate
      row :pubtype
      row :body
      row :figure
      row :image
      row :image_attribution
      row :audio
      row "Tags" do |t|
        a.tags.map(&:name).join(", ").html_safe
      end
      row :slug
      row :flag_message
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "References" do
      f.input :title
      f.input :description
      f.input :topic
      f.input :author_id, :as => :select, :collection => Author.all.map{|u| ["#{u.name}", u.id]}
      f.input :pubdate
      f.input :pubtype
    end
    f.inputs "Content" do
      f.input :body
    end
    f.inputs "Media" do
      f.input :figure
      f.input :image
      f.input :image_attribution
      f.input :audio
    end
    f.inputs "Meta" do
      f.input :flag_message
      f.has_many :tags do |t|
        t.input :name
      end
    end
    f.actions
  end

end
