json.array!(@tbl_pic_settings) do |tbl_pic_setting|
  json.extract! tbl_pic_setting, :id, :PicSettingID, :Title, :Height, :Width, :Type, :Mode, :Constraints, :Status
  json.url tbl_pic_setting_url(tbl_pic_setting, format: :json)
end
