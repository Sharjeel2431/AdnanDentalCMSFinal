class TblSlide < ActiveRecord::Base
  has_attached_file :avatar, styles: { small: "340x170", medium: "740x440", large: "1440x740" }

end
