class TblLayer < ActiveRecord::Base
  has_attached_file :avatar, styles: { small: "240x130", medium: "740x440", large: "1440x740" }
end
