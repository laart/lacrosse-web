class RemoveDescriptionFromRefineryVideos < ActiveRecord::Migration
  def up
  	remove_column :refinery_videos, :description
  end

  def down
  end
end
