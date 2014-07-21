class CreateTblPlaceHolderContents < ActiveRecord::Migration
  def change
    create_table :tbl_place_holder_contents do |t|
      t.integer :PlaceHolderID
      t.integer :ContentID

      t.timestamps
    end
  end
end
