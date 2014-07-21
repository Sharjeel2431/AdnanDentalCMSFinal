class CreateTblConfigs < ActiveRecord::Migration
  def change
    create_table :tbl_configs do |t|
      t.integer :ConfigID
      t.string :ConfigTitle
      t.integer :ConfigValue
      t.string :Type
      t.boolean :Status

      t.timestamps
    end
  end
end
