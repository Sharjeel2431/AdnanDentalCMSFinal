json.array!(@tbl_globals) do |tbl_global|
  json.extract! tbl_global, :id, :Token, :Name, :Status
  json.url tbl_global_url(tbl_global, format: :json)
end
