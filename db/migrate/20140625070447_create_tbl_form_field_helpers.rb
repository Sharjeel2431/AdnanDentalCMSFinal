class CreateTblFormFieldHelpers < ActiveRecord::Migration
  def change
    create_table :tbl_form_field_helpers do |t|
      t.integer :FormID
      t.integer :FieldID

      t.timestamps
    end
  end
end
