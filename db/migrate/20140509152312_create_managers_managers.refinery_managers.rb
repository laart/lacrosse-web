# This migration comes from refinery_managers (originally 1)
class CreateManagersManagers < ActiveRecord::Migration

  def up
    create_table :refinery_managers do |t|
      t.string :name
      t.string :surname
      t.string :position
      t.integer :telephone_number
      t.string :email
      t.boolean :in_contatcs, :default => false
      t.integer :position
      t.integer :photo_id

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-managers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/managers/managers"})
    end

    drop_table :refinery_managers

  end

end
