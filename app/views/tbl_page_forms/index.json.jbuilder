json.array!(@tbl_page_forms) do |tbl_page_form|
  json.extract! tbl_page_form, :id, :PageID, :FormID
  json.url tbl_page_form_url(tbl_page_form, format: :json)
end
