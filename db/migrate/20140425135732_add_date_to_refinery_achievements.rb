class AddDateToRefineryAchievements < ActiveRecord::Migration
  def change
    add_column :refinery_achievements, :date, :date
  end
end
