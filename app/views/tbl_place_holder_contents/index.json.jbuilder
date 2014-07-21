json.array!(@tbl_place_holder_contents) do |tbl_place_holder_content|
  json.extract! tbl_place_holder_content, :id, :PlaceHolderID, :ContentID
  json.url tbl_place_holder_content_url(tbl_place_holder_content, format: :json)
end
