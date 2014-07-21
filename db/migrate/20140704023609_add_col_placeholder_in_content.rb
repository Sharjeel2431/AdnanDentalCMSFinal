class AddColPlaceholderInContent < ActiveRecord::Migration
  def change
    add_column :tbl_contents,:PlaceHolder,:string
  end
end
