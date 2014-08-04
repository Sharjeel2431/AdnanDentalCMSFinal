class Fix < ActiveRecord::Migration
  def change
    add_column :tbl_slide_settings,:Setting,:string
    add_column :tbl_slides,:Setting,:string
  end
end
