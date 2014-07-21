json.array!(@tbl_page_banners) do |tbl_page_banner|
  json.extract! tbl_page_banner, :id, :PageID, :BannerID
  json.url tbl_page_banner_url(tbl_page_banner, format: :json)
end
