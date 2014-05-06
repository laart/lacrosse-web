class RenameImageIdToFeaturedImageId < ActiveRecord::Migration
  def change
    rename_column :refinery_blog_posts, :image_id, :featured_image_id
  end
end
