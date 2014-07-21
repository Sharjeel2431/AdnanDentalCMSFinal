json.array!(@tbl_banners) do |tbl_banner|
  json.extract! tbl_banner, :id, :BannerID, :Title, :Description, :ToolTip, :RedirectLink, :Type, :Status
  json.url tbl_banner_url(tbl_banner, format: :json)
end
