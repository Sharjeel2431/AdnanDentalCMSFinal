json.array!(@tbl_slide_settings) do |tbl_slide_setting|
  json.extract! tbl_slide_setting, :id, :offsetxin, :offsetxout, :offsetyin, :offsetyout, :rotatein, :rotateout, :fadein, :fadeout, :easingin, :easingout, :durationin, :delayin, :transition2d, :transition3d
  json.url tbl_slide_setting_url(tbl_slide_setting, format: :json)
end
