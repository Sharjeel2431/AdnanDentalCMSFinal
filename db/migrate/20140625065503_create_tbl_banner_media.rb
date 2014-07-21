class CreateTblBannerMedia < ActiveRecord::Migration
  def change
    create_table :tbl_banner_media do |t|
      t.integer :BannerID
      t.integer :MediaID

      t.timestamps
    end
  end
end
