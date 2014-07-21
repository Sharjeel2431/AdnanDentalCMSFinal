class AlOrthodonticsController < ApplicationController

  layout "lay_services"
  def Orthodontics

    # load all categories and select those category ID whose category title is SERVICES
    @categories=TblCategory.all
    @categoryinfo=TblCategory.find_by_CategoryTitle('SERVICES')
    @categoryID=@categoryinfo.CategoryID




########################### To Load Multiple Contents in Pages #############################
    @pagecategoryinfo=TblPageCategory.where(CategoryID: @categoryID)
    if params[:id] != nil

      @pagecontentinfo=TblPageContent.where(PageID: params[:id])

 #############################################################################################
    else
      params[:id] = 0

    end
  end
end
