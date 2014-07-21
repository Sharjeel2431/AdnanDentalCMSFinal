json.array!(@tbl_page_categories) do |tbl_page_category|
  json.extract! tbl_page_category, :id, :CategoryID, :PageID
  json.url tbl_page_category_url(tbl_page_category, format: :json)
end
