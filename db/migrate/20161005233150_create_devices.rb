class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :external_id, null: false, default: ""
      t.string :name
      t.integer :user_id

      t.timestamps
    end

    add_index :devices, :user_id
  end
end
