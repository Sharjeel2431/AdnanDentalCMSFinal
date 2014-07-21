class CreateTblLogins < ActiveRecord::Migration
  def change
    create_table :tbl_logins do |t|
      t.string :UserName
      t.string :Password

      t.timestamps
    end
  end
end
