class PlaceHolderNewController < ApplicationController
  def index
    @tbl_content=TblContent.all
  end

end
