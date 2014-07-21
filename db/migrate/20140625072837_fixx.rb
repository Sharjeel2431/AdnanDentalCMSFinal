class Fixx < ActiveRecord::Migration
  def change






    add_column :tbl_layouts,:LayoutID,:primary_key
    add_column :tbl_pages,:PageID,:primary_key
    add_column :tbl_contents,:ContentID,:primary_key
  end
end
