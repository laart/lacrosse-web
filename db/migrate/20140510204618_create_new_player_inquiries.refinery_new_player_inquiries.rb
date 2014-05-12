# This migration comes from refinery_new_player_inquiries (originally 1)
class CreateNewPlayerInquiries < ActiveRecord::Migration

  def up
    create_table :refinery_new_player_inquiries do |t|
      t.string :name
      t.string :surname
      t.integer :phone
      t.string :email
      t.integer :age
      t.text :experience

      t.timestamps
    end

    add_index :refinery_new_player_inquiries, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "new_player_inquiries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/new_player_inquiries"})
    end

    drop_table :refinery_new_player_inquiries
  end

end
