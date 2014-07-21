class CreateTblBanners < ActiveRecord::Migration
  def change
    create_table :tbl_banners do |t|
      t.integer :BannerID
      t.string :Title
      t.string :Description
      t.string :ToolTip
      t.string :RedirectLink
      t.string :Type
      t.boolean :Status

      t.timestamps
    end
  end
end
