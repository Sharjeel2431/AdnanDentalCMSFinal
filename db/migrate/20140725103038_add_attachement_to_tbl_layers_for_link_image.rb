class AddAttachementToTblLayersForLinkImage < ActiveRecord::Migration
  def self.up
    change_table :tbl_layers do |t|

      t.attachment :linkimage

    end
  end

  def self.down

    remove_attachment :tbl_layers, :linkimage

  end
end
