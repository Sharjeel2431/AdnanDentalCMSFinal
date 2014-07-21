json.array!(@tbl_configs) do |tbl_config|
  json.extract! tbl_config, :id, :ConfigID, :ConfigTitle, :ConfigValue, :Type, :Status
  json.url tbl_config_url(tbl_config, format: :json)
end
