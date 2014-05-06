class CreateAchievementsAchievements < ActiveRecord::Migration

  def up
    create_table :refinery_achievements do |t|
      t.string :tournament
      t.string :country
      t.integer :place
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-achievements"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/achievements/achievements"})
    end

    drop_table :refinery_achievements

  end

end
