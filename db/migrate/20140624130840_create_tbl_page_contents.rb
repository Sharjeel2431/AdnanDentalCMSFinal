class CreateTblPageContents < ActiveRecord::Migration
  def change
    create_table :tbl_page_contents do |t|
      t.integer :PageID
      t.integer :ContentID

      t.timestamps
    end
  end
end
