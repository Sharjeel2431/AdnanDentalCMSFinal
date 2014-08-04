class Settingsfix < ActiveRecord::Migration
  def change
    add_column :tbl_slide_settings,:showuntil,:integer
    add_column :tbl_slide_settings,:rotatexin,:integer
    add_column :tbl_slide_settings,:rotatexout,:integer
    add_column :tbl_slide_settings,:rotateyin,:integer
    add_column :tbl_slide_settings,:rotateyout,:integer
    add_column :tbl_slide_settings,:scaleyin,:integer
    add_column :tbl_slide_settings,:scaleyout,:integer
    add_column :tbl_slide_settings,:skewxin,:integer
    add_column :tbl_slide_settings,:skewxout,:integer
    add_column :tbl_slide_settings,:skewyin,:integer
    add_column :tbl_slide_settings,:skewyout,:integer
    add_column :tbl_slide_settings,:transformoriginin,:integer
    add_column :tbl_slide_settings,:transformoriginout,:integer

  end
end
