json.array!(@tbl_layouts) do |tbl_layout|
  json.extract! tbl_layout, :id, :LayoutID, :LayoutTitle, :Value, :Type, :Status
  json.url tbl_layout_url(tbl_layout, format: :json)
end
