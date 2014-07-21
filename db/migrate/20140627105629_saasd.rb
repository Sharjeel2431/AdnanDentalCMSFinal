class Saasd < ActiveRecord::Migration
  def change
    remove_column :tbl_placeholders,:PlaceHolderID
    remove_column :tbl_placeholders,:id

    add_column :tbl_placeholders,:PlaceHolderID,:primary_key

  end
end
