json.array!(@tbl_banner_media) do |tbl_banner_medium|
  json.extract! tbl_banner_medium, :id, :BannerID, :MediaID
  json.url tbl_banner_medium_url(tbl_banner_medium, format: :json)
end
