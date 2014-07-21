class CreateTblContents < ActiveRecord::Migration
  def change
    create_table :tbl_contents do |t|
      t.integer :ContentID
      t.string :ContentName
      t.text :ContentValue
      t.string :ContentType
      t.boolean :ContentStatus

      t.timestamps
    end
  end
end
