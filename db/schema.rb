# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140718103004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cms", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "place_holder_news", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_banner_media", force: true do |t|
    t.integer  "BannerID"
    t.integer  "MediaID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_banners", primary_key: "BannerID", force: true do |t|
    t.string   "Title"
    t.string   "Description"
    t.string   "ToolTip"
    t.string   "RedirectLink"
    t.string   "Type"
    t.boolean  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "PlaceHolder"
    t.integer  "PicSettingID"
  end

  create_table "tbl_categories", primary_key: "CategoryID", force: true do |t|
    t.string   "CategoryTitle"
    t.string   "CategoryURL"
    t.string   "Type"
    t.boolean  "IsPrimaryNav"
    t.boolean  "IsSecondaryNav"
    t.boolean  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_cms", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_configs", primary_key: "ConfigID", force: true do |t|
    t.string   "ConfigTitle"
    t.integer  "ConfigValue"
    t.string   "Type"
    t.boolean  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_contents", primary_key: "ContentID", force: true do |t|
    t.string   "ContentName"
    t.text     "ContentValue"
    t.string   "ContentType"
    t.boolean  "ContentStatus"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "PlaceHolder"
  end

  create_table "tbl_form_field_helpers", force: true do |t|
    t.integer  "FormID"
    t.integer  "FieldID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_form_fields", primary_key: "FieldID", force: true do |t|
    t.string   "FieldTitle"
    t.string   "FieldType"
    t.integer  "FieldValue"
    t.string   "Tooltip"
    t.boolean  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_forms", primary_key: "FormID", force: true do |t|
    t.string   "FormTitle"
    t.text     "FormDescription"
    t.string   "Type"
    t.boolean  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_globals", force: true do |t|
    t.string   "Token"
    t.string   "Name"
    t.boolean  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_layers", primary_key: "LayerID", force: true do |t|
    t.string   "Class"
    t.string   "Type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Content"
  end

  create_table "tbl_layout_placeholders", force: true do |t|
    t.integer  "LayoutID"
    t.integer  "PlaceHolderID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_layouts", primary_key: "LayoutID", force: true do |t|
    t.string   "LayoutTitle"
    t.integer  "Value"
    t.string   "Type"
    t.boolean  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "OnStateTag"
    t.string   "FilePath"
  end

  create_table "tbl_logins", force: true do |t|
    t.string   "UserName"
    t.string   "Password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_media", primary_key: "MediaID", force: true do |t|
    t.integer  "Value"
    t.integer  "Value2"
    t.string   "ToolTip"
    t.string   "RedirectLink"
    t.string   "Type"
    t.boolean  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_page_banners", force: true do |t|
    t.integer  "PageID"
    t.integer  "BannerID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_page_categories", force: true do |t|
    t.integer  "CategoryID"
    t.integer  "PageID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_page_contents", force: true do |t|
    t.integer  "PageID"
    t.integer  "ContentID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_page_forms", force: true do |t|
    t.integer  "PageID"
    t.integer  "FormID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_pages", primary_key: "PageID", force: true do |t|
    t.string   "PageTitle"
    t.string   "PageName"
    t.string   "PageURL"
    t.string   "Keywords"
    t.string   "Description"
    t.string   "LayoutID"
    t.boolean  "Status"
    t.string   "Type"
    t.datetime "DateTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_pic_settings", primary_key: "PicSettingID", force: true do |t|
    t.string   "Title"
    t.float    "Height"
    t.float    "Width"
    t.string   "Type"
    t.string   "Mode"
    t.string   "Constraints"
    t.boolean  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_place_holder_contents", force: true do |t|
    t.integer  "PlaceHolderID"
    t.integer  "ContentID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_place_holders", primary_key: "PlaceHolderID", force: true do |t|
    t.string   "PlaceHolderTitle"
    t.string   "PlaceHolderDesc"
    t.boolean  "IsActive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Type"
  end

  create_table "tbl_slide_layers", force: true do |t|
    t.integer  "SlideID"
    t.integer  "LayerID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_slides", primary_key: "SlideID", force: true do |t|
    t.string   "SlideClass"
    t.float    "SlideDelay"
    t.string   "Transition"
    t.string   "BackgroundImage"
    t.string   "SlideTransition"
    t.integer  "BannerID"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "transitions", primary_key: "TransitionID", force: true do |t|
    t.string   "TransitionName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
