json.array!(@tbl_layout_placeholders) do |tbl_layout_placeholder|
  json.extract! tbl_layout_placeholder, :id, :LayoutID, :PlaceHolderID
  json.url tbl_layout_placeholder_url(tbl_layout_placeholder, format: :json)
end
