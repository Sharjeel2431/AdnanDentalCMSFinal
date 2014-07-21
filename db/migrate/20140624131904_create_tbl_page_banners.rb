class CreateTblPageBanners < ActiveRecord::Migration
  def change
    create_table :tbl_page_banners do |t|
      t.integer :PageID
      t.integer :BannerID

      t.timestamps
    end
  end
end
