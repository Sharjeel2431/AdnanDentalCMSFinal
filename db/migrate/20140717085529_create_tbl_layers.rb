class CreateTblLayers < ActiveRecord::Migration
  def change
    create_table :tbl_layers do |t|
      t.integer :LayerID
      t.string :Class
      t.string :Type

      t.timestamps
    end
  end
end
