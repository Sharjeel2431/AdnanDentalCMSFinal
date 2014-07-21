class CreateTblPicSettings < ActiveRecord::Migration
  def change
    create_table :tbl_pic_settings do |t|
      t.integer :PicSettingID
      t.string :Title
      t.float :Height
      t.float :Width
      t.string :Type
      t.string :Mode
      t.string :Constraints
      t.boolean :Status

      t.timestamps
    end
  end
end
