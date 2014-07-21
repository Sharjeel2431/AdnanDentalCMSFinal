class Fixissue < ActiveRecord::Migration
  def change
    remove_column :tbl_contents,:ContentID
    remove_column :tbl_contents,:id
    remove_column :tbl_banners,:BannerID
    remove_column :tbl_banners,:id
    remove_column :tbl_media,:MediaID
    remove_column :tbl_media,:id
    remove_column :tbl_pic_settings,:PicSettingID
    remove_column :tbl_pic_settings,:id
    remove_column :tbl_form_fields,:FieldID
    remove_column :tbl_form_fields,:id
    remove_column :tbl_categories,:CategoryID
    remove_column :tbl_categories,:id
    remove_column :tbl_forms,:FormID
    remove_column :tbl_forms,:id
    remove_column :tbl_configs,:ConfigID
    remove_column :tbl_configs,:id
    remove_column :tbl_layouts,:LayoutID
    remove_column :tbl_layouts,:id
    remove_column :tbl_pages,:PageID
    remove_column :tbl_pages,:id




    add_column :tbl_layouts,:LayoutID,:primary_key
    add_column :tbl_pages,:PageID,:primary_key
    add_column :tbl_contents,:ContentID,:primary_key
    add_column :tbl_banners,:BannerID,:primary_key
    add_column :tbl_media,:MediaID,:primary_key
    add_column :tbl_pic_settings,:PicSettingID,:primary_key
    add_column :tbl_form_fields,:FieldID,:primary_key
    add_column :tbl_categories,:CategoryID,:primary_key
    add_column :tbl_forms,:FormID,:primary_key
    add_column :tbl_configs,:ConfigID,:primary_key

  end
end
