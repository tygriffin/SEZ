class FixColumnName < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    rename_column :posts, :image, :post_image
  end
end
