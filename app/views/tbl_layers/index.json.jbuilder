json.array!(@tbl_layers) do |tbl_layer|
  json.extract! tbl_layer, :id, :LayerID, :Class, :Type
  json.url tbl_layer_url(tbl_layer, format: :json)
end
