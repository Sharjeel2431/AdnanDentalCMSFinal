class Adsad < ActiveRecord::Migration
  def change
    remove_column :tbl_slide_settings,:id


    add_column :tbl_slide_settings,:SlideSettingID,:primary_key
  end
end
