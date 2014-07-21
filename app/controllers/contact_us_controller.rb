class ContactUsController < ApplicationController
  layout "lay"

  def ContactUs
    # To Load All Categories
    @categories=TblCategory.all
    ############################# To Load the Multiple Page Contents On the basis of Page ID #######################
    if params[:id] != nil

      @pagecontentinfo=TblPageContent.where(PageID: params[:id])

    else
      params[:id] = 0

    end
    ################################################################################################################
  end
end
