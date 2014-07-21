class CreateTblLayoutPlaceholders < ActiveRecord::Migration
  def change
    create_table :tbl_layout_placeholders do |t|
      t.integer :LayoutID
      t.integer :PlaceHolderID

      t.timestamps
    end
  end
end
