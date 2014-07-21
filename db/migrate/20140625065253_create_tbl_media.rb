class CreateTblMedia < ActiveRecord::Migration
  def change
    create_table :tbl_media do |t|
      t.integer :MediaID
      t.integer :Value
      t.integer :Value2
      t.string :ToolTip
      t.string :RedirectLink
      t.string :Type
      t.boolean :Status

      t.timestamps
    end
  end
end
