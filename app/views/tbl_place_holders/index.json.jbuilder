json.array!(@tbl_place_holders) do |tbl_place_holder|
  json.extract! tbl_place_holder, :id, :PlaceHolderID, :PlaceHolderTitle, :PlaceHolderDesc, :IsActive
  json.url tbl_place_holder_url(tbl_place_holder, format: :json)
end
