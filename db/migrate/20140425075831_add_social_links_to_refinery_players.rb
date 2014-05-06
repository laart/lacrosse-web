class AddSocialLinksToRefineryPlayers < ActiveRecord::Migration
  def change
    add_column :refinery_players, :draugiem, :string
    add_column :refinery_players, :twitter, :string
    add_column :refinery_players, :facebook, :string
    add_column :refinery_players, :googleplus, :string
  end
end
