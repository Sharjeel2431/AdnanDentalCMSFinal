class CreateTblPlaceHolders < ActiveRecord::Migration
  def change
    create_table :tbl_place_holders do |t|
      t.integer :PlaceHolderID
      t.string :PlaceHolderTitle
      t.string :PlaceHolderDesc
      t.boolean :IsActive

      t.timestamps
    end
  end
end
