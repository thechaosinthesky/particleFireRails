class CreateIos < ActiveRecord::Migration[5.0]
  def change
    create_table :ios do |t|
      t.integer :device_id, null: false
      t.string :name
      t.string :io_type, null: false
      t.string :settings

      t.timestamps
    end
  end
end
