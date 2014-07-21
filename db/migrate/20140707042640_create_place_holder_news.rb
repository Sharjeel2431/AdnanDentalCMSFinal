class CreatePlaceHolderNews < ActiveRecord::Migration
  def change
    create_table :place_holder_news do |t|

      t.timestamps
    end
  end
end
