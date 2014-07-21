class CreateTblPageForms < ActiveRecord::Migration
  def change
    create_table :tbl_page_forms do |t|
      t.integer :PageID
      t.integer :FormID

      t.timestamps
    end
  end
end
