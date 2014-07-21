json.array!(@tbl_logins) do |tbl_login|
  json.extract! tbl_login, :id, :UserName, :Password
  json.url tbl_login_url(tbl_login, format: :json)
end
