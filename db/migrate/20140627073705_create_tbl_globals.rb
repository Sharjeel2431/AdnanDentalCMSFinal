class CreateTblGlobals < ActiveRecord::Migration
  def change
    create_table :tbl_globals do |t|
      t.string :Token
      t.string :Name
      t.boolean :Status

      t.timestamps
    end
  end
end
