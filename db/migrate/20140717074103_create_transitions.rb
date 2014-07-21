class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.integer :TransitionID
      t.string :TransitionName

      t.timestamps
    end
  end
end
