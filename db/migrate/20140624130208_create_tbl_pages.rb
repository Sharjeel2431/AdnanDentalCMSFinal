class CreateTblPages < ActiveRecord::Migration
  def change
    create_table :tbl_pages do |t|
      t.integer :PageID
      t.string :PageTitle
      t.string :PageName
      t.string :PageURL
      t.string :Keywords
      t.string :Description
      t.string :LayoutID
      t.boolean :Status
      t.string :Type
      t.datetime :DateTime

      t.timestamps
    end
  end
end
