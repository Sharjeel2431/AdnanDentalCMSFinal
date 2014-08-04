class TblPagesController < ApplicationController

  before_action :set_tbl_page, only: [:show, :edit, :update, :destroy]

  # GET /tbl_pages
  # GET /tbl_pages.json
  def index

    @tbl_pages = TblPage.all
    session[:pageindex]=1
    @totpage=TblPage.count

  end

  # GET /tbl_pages/1
  # GET /tbl_pages/1.json
  def show

      if session[:updateurl] == 1
        @pageinfo=TblPage.find_by_PageID(params[:id])
        @pagetitle=@pageinfo.PageTitle
        @page_last=@pageinfo.PageID
        @layoutID=@pageinfo.LayoutID
        @layoutinfo=TblLayout.find_by_LayoutID(@layoutID)
        @OnStateTag=@layoutinfo.OnStateTag

        if session[:last_layout] != @layoutID
          query12='Update tbl_pages SET "PageURL"='+"'"+"#{@OnStateTag}"+"/"+"#{@pagetitle}"+"/"+"#{params[:id]}"+"'"+' where "PageID"='+"#{params[:id]}"+';'


          ActiveRecord::Base.connection.execute(query12);
        end

      end

    if session[:new_page]==1

      @querylast=  TblPage.last()


      @page_last=@querylast.PageID
       #@datetime=Time.now.strftime("%d/%m/%Y%H:%M") +" UTC"

        query1='UPDATE tbl_pages SET "LayoutID"='+"#{session[:hidden_layout]}"+'where "PageID"='+"#{@page_last}"+';'
       # query2="UPDATE tbl_pages SET DateTime=#{@datetime} where PageID=#{@page_last}"

        ActiveRecord::Base.connection.execute(query1);
        #ActiveRecord::Base.connection.execute(query2);

      #################### Default content When New Page is added ##################################



      @pagein=TblPage.find_by_PageID(@querylast.PageID)
      @lid=@pagein.LayoutID
      @layoutplaceholderinfo=TblLayoutPlaceholder.where(LayoutID: @lid)




      @layoutplaceholderinfo.each do |index|

        @placeHolder_info=TblPlaceHolder.where(PlaceHolderID: index.PlaceHolderID)
        @placeHolder_info.each do |index|
          @placeHolderTitle=index.PlaceHolderTitle
          @placeholdID=index.PlaceHolderID





          @inf=TblPlaceHolder.where(PlaceHolderTitle: @placeHolderTitle)
          @inf.each do |index|
            if index.Type == 'Banner'

             #   @PlaceHolderinfo=TblPlaceHolder.find_by_Type(index.Type)

              bannerquery='INSERT INTO tbl_banners ("Title","PlaceHolder","Description","ToolTip","RedirectLink","Type","Status") values
                         ('+"'"+"Default Primary"+"'"+","+"'"+"#{index.PlaceHolderTitle}"+"'"+","+"'"+"None"+"'"+","+"'"+"None"+"'"+","+"'"+"None"+"'"+","+"'"+"Rotating"+"'"+","+"'"+"true"+"'"+");"

              ActiveRecord::Base.connection.execute(bannerquery);

              @bannerin=TblBanner.where(PlaceHolder: index.PlaceHolderTitle)

              @bannerin.each do |index|
                qq='INSERT INTO tbl_page_Banners ("BannerID","PageID") values
                  ('+"#{index.BannerID}"+","+"#{@querylast.PageID});"

                ActiveRecord::Base.connection.execute(qq);

              end


            end
          end


            if index.Type=="Banner"
              contentval='<div id="layerslider" style="width: 800px; height: 400px;"></div>'
            else
              contentval='<br/><h1>Please Add Your Content!</h1>'
            end

          querycon='INSERT INTO tbl_contents ("ContentName","PlaceHolder","ContentValue","ContentType","ContentStatus") values
                ('+'Default'+","+"'"+"#{@placeHolderTitle}"+"'"+","+"'"+"#{contentval}"+"'"+","+"'pages'"+","+"'true'"+");"

          ActiveRecord::Base.connection.execute(querycon);



          @content=TblContent.where(PlaceHolder: index.PlaceHolderTitle)

          @content.each do |index|

            queryconn1='INSERT INTO tbl_place_holder_contents ("PlaceHolderID" ,"ContentID" ) values
                  ('+"#{@placeholdID}"+','+"#{index.ContentID});"

            ActiveRecord::Base.connection.execute(queryconn1);



            @placeholdercontentinfo=TblPlaceHolderContent.where(PlaceHolderID: @placeholdID)

         @placeholdercontentinfo.each do |index|

             @ContentID=index.ContentID

             queryfornewpagecon='Insert into tbl_page_contents ("PageID","ContentID") values ('+"#{@querylast.PageID}"+","+"#{@ContentID});"
             ActiveRecord::Base.connection.execute(queryfornewpagecon);


         end

          end

        end

      end









    ##  @contentinfotbl=TblContent.last

    #  deletequery="DELETE FROM tbl_place_holder_contents WHERE PlaceHolderID=#{@placeholderID};"

     # ActiveRecord::Base.connection.execute(deletequery);


     ## @placeholdercontentinfo=TblPlaceHolderContent.find_by_PlaceHolderID(@placeholderID)
##      @ContentID=@placeholdercontentinfo.ContentID


     # queryfornewpagecon="Insert into tbl_page_contents (PageID,ContentID) values (#{@querylast.PageID},#{@ContentID});"
     # ActiveRecord::Base.connection.execute(queryfornewpagecon);
      ###############################################################################################
    end


    if session[:pageindex]=0
        @querylast=  TblPage.last()

        @page_last=@querylast.PageID
        @last=TblPage.find_by_PageID(@page_last)
        @layoutid=@last.LayoutID
        @pagetitle=@last.PageTitle

        @layoutinfo=TblLayout.find_by_LayoutID(@layoutid)
        @OnStateTag=@layoutinfo.OnStateTag

        #@pagecontent=TblPageContent.find_by_PageID(@page_last)
        #@contentID=@pagecontent.ContentID
        #@content=TblContent.find_by_ContentID(1)
        #@contentName=@content.ContentName

        query3='UPDATE tbl_pages SET "PageURL"='+"'"+"#{@OnStateTag}"+'/'+"#{@pagetitle}"+'/'+"#{@page_last}"+"'"+ 'where "PageID"='+"#{@page_last};"
        ActiveRecord::Base.connection.execute(query3);
    end
  end

  # GET /tbl_pages/new
  def new

    @tbl_page = TblPage.new
    session[:updateurl]=0
    session[:new_page]=1;
    session[:pageindex]=0

  end

  # GET /tbl_pages/1/edit
  def edit
    session[:contentindex]=0  #for execute the content edit portion which is used on this edit page to edit content (placeholder)
    session[:updateurl]=1
    session[:forupdate]=params[:id]
    session[:bannerdeletionedit]=1
    session[:contentdeleteedit]=1
    session[:contentedittoplaceholder]=1;
    session[:oneditpage]=1
    session[:pageidonedit]=params[:id]
    session[:fromeditpage]=1
    session[:new_page]=0
    session[:pageid]=params[:id]

    @pageinfo=TblPage.find_by_PageID(params[:id])
    @LastLayout=@pageinfo.LayoutID
    session[:last_layout]=@LastLayout

    if params[:id] != nil

      @cat=TblPageCategory.find_by_PageID(params[:id])
      @catID=@cat.CategoryID
      @catinfo=TblCategory.find_by_CategoryID(@catID)
      @cattitle=@catinfo.CategoryTitle

    else
      @cattitle ='please select Category'

    end
    if params[:id] != nil

      @lay=TblPage.find_by_PageID(params[:id])
      @layID=@lay.LayoutID
      @layinfo=TblLayout.find_by_LayoutID(@layID)
      @laytitle=@layinfo.LayoutTitle

    else
      @laytitle ='please select Layout'
    end

  end

  # POST /tbl_pages
  # POST /tbl_pages.json
  def create
    @tbl_page = TblPage.new(tbl_page_params)

    respond_to do |format|
      if @tbl_page.save




        if params[:cat_hid]== ""
          params[:cat_hid]=1
        end
        if params[:layout_hid]== ""
          params[:layout_hid]=1
        end


        format.html { redirect_to @tbl_page, notice: 'Tbl page was successfully created.' }

        @querylast=  TblPage.last()

        @page_last=@querylast.PageID

        if params[:id]==nil
          query='INSERT INTO tbl_page_categories ("PageID","CategoryID") values ('+"#{@page_last}"+','+"#{params[:cat_hid]});"

          ActiveRecord::Base.connection.execute(query);
        end

          session[:hidden_layout]=params[:layout_hid]

        format.json { render :show, status: :created, location: @tbl_page }
      else
        format.html { render :new }
        format.json { render json: @tbl_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_pages/1
  # PATCH/PUT /tbl_pages/1.json
  def update

    respond_to do |format|

      if @tbl_page.update(tbl_page_params)

        if params[:id]!=nil

          if params[:cat_hid]== ""
            @info_cat=TblPageCategory.find_by_PageID(session[:forupdate])
            params[:cat_hid]= @info_cat.CategoryID

          end

        query='UPDATE tbl_page_categories SET "CategoryID"='+"#{params[:cat_hid]}"+' where "PageID" ='+"#{session[:forupdate]};"

          if params[:layout_hid] == ""
            @info=TblPage.find_by_PageID(session[:forupdate])
            params[:layout_hid]=@info.LayoutID
          end

        query1='UPDATE tbl_pages SET "LayoutID"='+"#{params[:layout_hid]}"+' where "PageID" ='+"#{session[:forupdate]};"

          ActiveRecord::Base.connection.execute(query);

          ActiveRecord::Base.connection.execute(query1);


        end



        format.html { redirect_to @tbl_page, notice: 'Tbl page was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_page }

      else
        format.html { render :edit }
        format.json { render json: @tbl_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_pages/1
  # DELETE /tbl_pages/1.json
  def destroy

    if session[:pageindex]==1

      query='DELETE FROM tbl_page_contents WHERE "PageID"='+"#{params[:id]};"
      query1='DELETE FROM tbl_page_banners WHERE "PageID"='+"#{params[:id]};"
      query2='DELETE FROM tbl_page_categories WHERE "PageID"='+"#{params[:id]};"
      ActiveRecord::Base.connection.execute(query);
      ActiveRecord::Base.connection.execute(query1);
      ActiveRecord::Base.connection.execute(query2);

      @tbl_page.destroy

    end

    respond_to do |format|
      format.html { redirect_to tbl_pages_url, notice: 'Tbl page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_page

      @tbl_page = TblPage.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_page_params
      params.require(:tbl_page).permit(:PageID, :PageTitle, :PageName, :PageURL, :Keywords, :Description, :LayoutID, :Status, :Type, :DateTime)
    end
end
