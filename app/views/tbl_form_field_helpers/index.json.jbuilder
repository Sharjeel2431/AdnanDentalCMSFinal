json.array!(@tbl_form_field_helpers) do |tbl_form_field_helper|
  json.extract! tbl_form_field_helper, :id, :FormID, :FieldID
  json.url tbl_form_field_helper_url(tbl_form_field_helper, format: :json)
end
