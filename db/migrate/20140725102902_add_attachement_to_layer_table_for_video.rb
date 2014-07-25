class AddAttachementToLayerTableForVideo < ActiveRecord::Migration
  def self.up
    change_table :tbl_layers do |t|

      t.attachment :video

    end
  end

  def self.down

    remove_attachment :tbl_layers, :video

  end
end
