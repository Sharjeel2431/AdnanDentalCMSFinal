class CreateTblSlideLayers < ActiveRecord::Migration
  def change
    create_table :tbl_slide_layers do |t|
      t.integer :SlideID
      t.integer :LayerID

      t.timestamps
    end
  end
end
