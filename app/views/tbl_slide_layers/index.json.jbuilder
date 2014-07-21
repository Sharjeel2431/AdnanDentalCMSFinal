json.array!(@tbl_slide_layers) do |tbl_slide_layer|
  json.extract! tbl_slide_layer, :id, :SlideID, :LayerID
  json.url tbl_slide_layer_url(tbl_slide_layer, format: :json)
end
