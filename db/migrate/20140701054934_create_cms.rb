class CreateCms < ActiveRecord::Migration
  def change
    create_table :cms do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :password_salt

      t.timestamps
    end
  end
end
