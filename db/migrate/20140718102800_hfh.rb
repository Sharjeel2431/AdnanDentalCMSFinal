class Hfh < ActiveRecord::Migration
  def change

    remove_column :tbl_slides,:avatar_file_name
    remove_column :tbl_slides,:avatar_content_type
    remove_column :tbl_slides,:avatar_file_size
    remove_column :tbl_slides,:avatar_updated_at
    remove_attachment :tbl_slides, :avatar
  end
end
