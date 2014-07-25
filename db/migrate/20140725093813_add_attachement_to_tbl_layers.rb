class AddAttachementToTblLayers < ActiveRecord::Migration
  def self.up
    change_table :tbl_layers do |t|

      t.attachment :avatar

    end
  end

  def self.down

    remove_attachment :tbl_layers, :avatar

  end
end
