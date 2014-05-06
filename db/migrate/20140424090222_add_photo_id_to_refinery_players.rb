class AddPhotoIdToRefineryPlayers < ActiveRecord::Migration
  def change
    add_column :refinery_players, :photo_id, :integer
  end
end
