class AddFeaturedImageIdToRefineryVideos < ActiveRecord::Migration
  def change
    add_column :refinery_videos, :featured_image_id, :integer
  end
end
