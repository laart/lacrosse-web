class AddImportantToRefineryEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :important, :boolean, :default => false
  end
end
