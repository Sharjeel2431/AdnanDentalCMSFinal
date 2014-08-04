class Gosett < ActiveRecord::Migration
  def change
    remove_column :tbl_slide_settings,:transformoriginin
    remove_column :tbl_slide_settings,:transformoriginout

    add_column :tbl_slide_settings,:transformoriginin,:string
    add_column :tbl_slide_settings,:transformoriginout,:string
  end
end
