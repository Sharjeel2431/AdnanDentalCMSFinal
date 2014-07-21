class CreateTblFormFields < ActiveRecord::Migration
  def change
    create_table :tbl_form_fields do |t|
      t.integer :FieldID
      t.string :FieldTitle
      t.string :FieldType
      t.integer :FieldValue
      t.string :Tooltip
      t.boolean :Status

      t.timestamps
    end
  end
end
