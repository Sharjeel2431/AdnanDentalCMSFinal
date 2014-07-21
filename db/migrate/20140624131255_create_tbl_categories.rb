class CreateTblCategories < ActiveRecord::Migration
  def change
    create_table :tbl_categories do |t|
      t.integer :CategoryID
      t.string :CategoryTitle
      t.string :CategoryURL
      t.string :Type
      t.boolean :IsPrimaryNav
      t.boolean :IsSecondaryNav
      t.boolean :Status

      t.timestamps
    end
  end
end
