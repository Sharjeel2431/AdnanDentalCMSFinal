class Dum < ActiveRecord::Migration
  def change
    remove_column :tbl_place_holders,:PlaceHolderID
    remove_column :tbl_place_holders,:id

    add_column :tbl_place_holders,:PlaceHolderID,:primary_key
  end
end
