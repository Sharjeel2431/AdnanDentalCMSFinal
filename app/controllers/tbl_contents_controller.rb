class TblContentsController < ApplicationController
  before_action :set_tbl_content, only: [:show, :edit, :newplac ,:update, :destroy]

  # GET /tbl_contents
  # GET /tbl_contents.json
  def index
    @tbl_contents = TblContent.all
   session[:contentdeleteedit]=0
    session[:contentedittoplaceholder]=0
    session[:contentindex]=1
   # session[:deletecontentissue]=0
  end

  # GET /tbl_contents/1
  # GET /tbl_contents/1.json
  def show



  end



  # GET /tbl_contents/new
  def new



      @tbl_content = TblContent.new

      if params[:id] == "placeholder"  #check in the url if the query string contains placeholder it will show the drodown with next button

        if params[:page_hid] == nil

          ######## Check if the hidden field is empty then add the first entry from the table ###########
          @pageinfo=TblPage.first
          params[:page_hid] =@pageinfo.PageID
          ###############################################################################################

        end
          session[:plac]=1
          session[:newplaccont]=0
          session[:oneditpage]=0
          session[:page_id]=params[:page_hid]
      end


        if params[:id] != nil

          if session[:oneditpage] != 1

            if params[:id] != "placeholder"

            @layoutinfo=TblPage.find_by_PageID(params[:id])
            @layoutID=@layoutinfo.LayoutID


            end
          session[:newplaccont]=1

          end
          if session[:oneditpage] == 1

          end

        end



        if params[:id] == nil
          session[:newplaccont]=0
          session[:oneditpage]=0
            session[:plac]=0
        end

      if params[:id] != "placeholder"


    if params[:id] == nil
    session[:decision]=0

    else

    session[:pageid]=params[:id]
    session[:decision]=1

  end
    end


end

  # GET /tbl_contents/1/edit
  def edit

    if session[:contentindex] == 1
      session[:contentindex]=1

    end

    if session[:contentindex] != 1

      @info=TblContent.find_by_ContentID(params[:id])
      @placeTitle=@info.PlaceHolder
    end
  end

  # POST /tbl_contents
  # POST /tbl_contents.json
  def create


    @tbl_content = TblContent.new(tbl_content_params)

    respond_to do |format|

      if @tbl_content.save
        if params[:id] == nil
          session[:plac] =0
        end
        if params[:id] == "placeholder"

          session[:plac] =1

        end

        if session[:plac] != 0





        end
        if session[:oneditpage] == 1
          if params[:placehold_hid] == ""

            @pageinfao=TblPage.find_by_PageID(session[:forupdate])
            @layoid=@pageinfao.LayoutID
            @layplaceholderinfo=TblLayoutPlaceholder.find_by_LayoutID(@layoid)
            @placeholderid=@layplaceholderinfo.PlaceHolderID

            params[:placehold_hid] = @placeholderid

          end
          @querylastcontent=TblContent.last
          @Contentid=@querylastcontent.ContentID

          querycontentaddpage="INSERT INTO tbl_page_contents (PageID,ContentID) values (#{session[:forupdate]},#{@Contentid});"
          querycontentadd="INSERT INTO tbl_place_holder_contents (PlaceHolderID,ContentID) values(#{params[:placehold_hid]},#{@Contentid});"

          ActiveRecord::Base.connection.execute(querycontentaddpage);
          ActiveRecord::Base.connection.execute(querycontentadd);
        end
        format.html { redirect_to @tbl_content, notice: 'Tbl content was successfully created.' }



        format.json { render :show, status: :created, location: @tbl_content }

      else
        format.html { render :new }
        format.json { render json: @tbl_content.errors, status: :unprocessable_entity }
      end
    end
end


  # PATCH/PUT /tbl_contents/1
  # PATCH/PUT /tbl_contents/1.json
  def update
    respond_to do |format|
      if @tbl_content.update(tbl_content_params)
        format.html { redirect_to @tbl_content, notice: 'Tbl content was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_content }
      else
        format.html { render :edit }
        format.json { render json: @tbl_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_contents/1
  # DELETE /tbl_contents/1.json
  def destroy

    #whenever delete button is pressed from edit page only entry is deleted from
    #bridge table

    if params[:id] != nil
      if  session[:contentdeleteedit] == 1
        query = "DELETE FROM tbl_page_contents where PageID =#{session[:pageid]} and ContentID =#{params[:id]};"

        ActiveRecord::Base.connection.execute(query);
      end
    end

    #whenever delete button is pressed from content index page entry is deleted from content table as well
    #as from the bridge table

    if session[:contentdeleteedit] == 0
      query = "DELETE FROM tbl_page_contents where PageID =#{session[:pageid]} and ContentID =#{params[:id]};"
      query1="DELETE FROM tbl_place_holder_contents where ContentID=#{params[:id]};"
      ActiveRecord::Base.connection.execute(query);
      ActiveRecord::Base.connection.execute(query1);
      @tbl_content.destroy
    end


    respond_to do |format|
      format.html { redirect_to tbl_contents_url, notice: 'Tbl content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_content
      @tbl_content = TblContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_content_params
      params.require(:tbl_content).permit(:ContentID, :ContentName, :ContentValue, :ContentType, :ContentStatus, :PlaceHolder)
    end
end
