class Addtypeplaceholder < ActiveRecord::Migration
  def change
    add_column :tbl_place_holders,:Type,:string
  end
end
