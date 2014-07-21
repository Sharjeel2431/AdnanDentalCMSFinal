json.array!(@tbl_form_fields) do |tbl_form_field|
  json.extract! tbl_form_field, :id, :FieldID, :FieldTitle, :FieldType, :FieldValue, :Tooltip, :Status
  json.url tbl_form_field_url(tbl_form_field, format: :json)
end
