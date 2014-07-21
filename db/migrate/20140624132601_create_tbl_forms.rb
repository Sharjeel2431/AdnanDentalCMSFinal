class CreateTblForms < ActiveRecord::Migration
  def change
    create_table :tbl_forms do |t|
      t.integer :FormID
      t.string :FormTitle
      t.text :FormDescription
      t.string :Type
      t.boolean :Status

      t.timestamps
    end
  end
end
