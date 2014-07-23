class TblSlide < ActiveRecord::Base
  has_attached_file :avatar, styles: { small: "64x64", medium: "100x100", large: "200x200" }

end
