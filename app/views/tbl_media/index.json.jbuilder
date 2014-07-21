json.array!(@tbl_media) do |tbl_medium|
  json.extract! tbl_medium, :id, :MediaID, :Value, :Value2, :ToolTip, :RedirectLink, :Type, :Status
  json.url tbl_medium_url(tbl_medium, format: :json)
end
