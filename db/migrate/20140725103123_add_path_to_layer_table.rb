class AddPathToLayerTable < ActiveRecord::Migration
  def change
    add_column :tbl_layers,:Path,:string
  end
end
