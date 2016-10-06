class IosProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :ios_profiles do |t|
        t.integer :io_id
        t.integer :profile_id
    end

    add_index :ios_profiles, [:io_id, :profile_id], :unique => true
  	add_index :ios_profiles, :profile_id
  end
end
