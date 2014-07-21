json.array!(@tbl_slides) do |tbl_slide|
  json.extract! tbl_slide, :id, :SlideID, :SlideClass, :SlideDelay, :Transition, :BackgroundImage, :SlideTransition, :BannerID
  json.url tbl_slide_url(tbl_slide, format: :json)
end
