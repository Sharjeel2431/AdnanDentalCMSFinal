json.array!(@tbl_page_contents) do |tbl_page_content|
  json.extract! tbl_page_content, :id, :PageID, :ContentID
  json.url tbl_page_content_url(tbl_page_content, format: :json)
end
