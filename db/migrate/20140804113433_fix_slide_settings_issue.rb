class FixSlideSettingsIssue < ActiveRecord::Migration
  def change

    add_column :tbl_slide_settings,:scalexin,:integer
    add_column :tbl_slide_settings,:scalexout,:integer
    add_column :tbl_slide_settings,:durationout,:integer


  end
end
