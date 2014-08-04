class CreateTblSlideSettings < ActiveRecord::Migration
  def change
    create_table :tbl_slide_settings do |t|
      t.string :offsetxin
      t.string :offsetxout
      t.string :offsetyin
      t.string :offsetyout
      t.string :rotatein
      t.string :rotateout
      t.boolean :fadein
      t.boolean :fadeout
      t.string :easingin
      t.string :easingout
      t.string :durationin
      t.string :delayin
      t.string :transition2d
      t.string :transition3d

      t.timestamps
    end
  end
end
