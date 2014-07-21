class CreateTblLayouts < ActiveRecord::Migration
  def change
    create_table :tbl_layouts do |t|
      t.integer :LayoutID
      t.string :LayoutTitle
      t.integer :Value
      t.string :Type
      t.boolean :Status

      t.timestamps
    end
  end
end
