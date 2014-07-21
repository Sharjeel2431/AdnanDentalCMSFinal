class CreateTblPageCategories < ActiveRecord::Migration
  def change
    create_table :tbl_page_categories do |t|
      t.integer :CategoryID
      t.integer :PageID

      t.timestamps
    end
  end
end
