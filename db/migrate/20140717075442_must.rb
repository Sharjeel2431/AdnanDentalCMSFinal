class Must < ActiveRecord::Migration
  def change
    remove_column :transitions,:TrnasitionID
    remove_column :transitions,:id

    add_column :transitions,:TransitionID,:primary_key
  end
end
