class AddAttachmentAvatarToTblSlides < ActiveRecord::Migration
  def self.up
    change_table :tbl_slides do |t|

      t.attachment :avatar

    end
  end

  def self.down

    remove_attachment :tbl_slides, :avatar

  end
end
