json.array!(@tbl_forms) do |tbl_form|
  json.extract! tbl_form, :id, :FormID, :FormTitle, :FormDescription, :Type, :Status
  json.url tbl_form_url(tbl_form, format: :json)
end
