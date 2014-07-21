json.array!(@tbl_pages) do |tbl_page|
  json.extract! tbl_page, :id, :PageID, :PageTitle, :PageName, :PageURL, :Keywords, :Description, :LayoutID, :Status, :Type, :DateTime
  json.url tbl_page_url(tbl_page, format: :json)
end
