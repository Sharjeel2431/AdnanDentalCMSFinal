class CreateTblSlides < ActiveRecord::Migration
  def change
    create_table :tbl_slides do |t|
      t.integer :SlideID
      t.string :SlideClass
      t.float :SlideDelay
      t.string :Transition
      t.string :BackgroundImage
      t.string :SlideTransition
      t.integer :BannerID

      t.timestamps
    end
  end
end
