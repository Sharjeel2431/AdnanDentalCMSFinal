class HomeController < ApplicationController
layout "homelayout"

def Home
  # To Load All Categories
  @categories=TblCategory.all

  ############################# To Load the Multiple Page Contents On the basis of Page ID #######################

if params[:id] == nil
  params[:id]=0
end

if params[:id] != nil

@pagecontentinfo=TblPageContent.where(PageID: params[:id])



else
  params[:id] = 0

end
#################################################################################################################
end

end
