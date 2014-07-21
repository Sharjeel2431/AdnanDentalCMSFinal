json.array!(@tbl_contents) do |tbl_content|
  json.extract! tbl_content, :id, :ContentID, :ContentName, :ContentValue, :ContentType, :ContentStatus
  json.url tbl_content_url(tbl_content, format: :json)
end
