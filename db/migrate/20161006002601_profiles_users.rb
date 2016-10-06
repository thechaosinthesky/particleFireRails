class ProfilesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles_users, :id => false do |t|
      t.integer :profile_id
      t.integer :user_id
    end

    add_index :profiles_users, [:profile_id, :user_id], :unique => true
    add_index :profiles_users, :user_id
  end
end
