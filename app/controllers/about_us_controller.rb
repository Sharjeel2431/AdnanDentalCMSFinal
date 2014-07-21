class AboutUsController < ApplicationController
  layout "lay"

  def AboutUs

    # To Load All Categories
    @categories=TblCategory.all

    ############################# To Load the Multiple Page Contents On the basis of Page ID #######################
    if params[:id]!=nil
      @pagecontentinfo=TblPageContent.where( PageID: params[:id])

       @pageinfo=TblPage.find_by_PageID(params[:id])
      @pageURL=@pageinfo.PageURL
    else

        params[:id] = 0

    end
    ################################################################################################################

  end
end
