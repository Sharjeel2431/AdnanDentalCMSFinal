class TblPlaceHoldersController < ApplicationController
  before_action :set_tbl_place_holder, only: [:show, :edit, :update, :destroy]

  # GET /tbl_place_holders
  # GET /tbl_place_holders.json
  def index
    @tbl_place_holders = TblPlaceHolder.all
    session[:placeholderdeleted] = 0
  end

  # GET /tbl_place_holders/1
  # GET /tbl_place_holders/1.json
  def show
  end

  # GET /tbl_place_holders/new
  def new
    @tbl_place_holder = TblPlaceHolder.new
    if params[:id] == nil
      session[:decision_placeholder]=0
    else

      session[:layoutID]=params[:id]
      session[:decision_placeholder]=1
    end
  end

  # GET /tbl_place_holders/1/edit
  def edit
    if params[:id] != nil
    @place=TblPlaceHolder.find_by_PlaceHolderID(params[:id])
    @placeTitle=@place.Type
      end
  end

  # POST /tbl_place_holders
  # POST /tbl_place_holders.json
  def create
    @tbl_place_holder = TblPlaceHolder.new(tbl_place_holder_params)

    respond_to do |format|
      if @tbl_place_holder.save
        format.html { redirect_to @tbl_place_holder, notice: 'Tbl place holder was successfully created.' }

        @querylast=  TblPlaceHolder.last()

        @placeholderID_last=@querylast.PlaceHolderID

        if params[:id] = @placeholderID_last
          if session[:decision_placeholder] == 1
            query="INSERT INTO tbl_layout_placeholders (PlaceHolderID,LayoutID) values (#{@placeholderID_last},#{session[:layoutID]});"

            ActiveRecord::Base.connection.execute(query);
          end
        end

        if session[:placeholderdeleted] == 0
            if params[:placehold_hid] == ""
                  @placeholdinfo=TblPlaceHolder.first
                  @placeholdid=@placeholdinfo.PlaceHolderID
                  params[:placehold_hid]=@placeholdid
            end
            @placeinfo=TblPlaceHolder.find_by_PlaceHolderID(params[:placehold_hid])
            @placetype=@placeinfo.Type
          query="UPDATE tbl_place_holders SET Type='#{@placetype}' where PlaceHolderID=#{@placeholderID_last};"
            ActiveRecord::Base.connection.execute(query);
        end

        format.json { render :show, status: :created, location: @tbl_place_holder }
      else
        format.html { render :new }
        format.json { render json: @tbl_place_holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_place_holders/1
  # PATCH/PUT /tbl_place_holders/1.json
  def update
    respond_to do |format|
      if @tbl_place_holder.update(tbl_place_holder_params)

        if session[:placeholderdeleted] == 0


          if params[:placehold_hid] == ""
            @placeholdinfo=TblPlaceHolder.find_by_PlaceHolderID(params[:id])
            @placeholdid=@placeholdinfo.PlaceHolderID
            params[:placehold_hid]=@placeholdid
          end

          @placeinfo=TblPlaceHolder.find_by_PlaceHolderID(params[:placehold_hid])
          @placetype=@placeinfo.Type

          query="UPDATE tbl_place_holders SET Type='#{@placetype}' where PlaceHolderID=#{params[:id]};"
          ActiveRecord::Base.connection.execute(query);

        end

        format.html { redirect_to @tbl_place_holder, notice: 'Tbl place holder was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbl_place_holder }
      else
        format.html { render :edit }
        format.json { render json: @tbl_place_holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_place_holders/1
  # DELETE /tbl_place_holders/1.json
  def destroy
    #whenever delete button is pressed from edit page only entry is deleted from
    #bridge table

    if params[:id] != nil
      if  session[:placeholderdeleted] == 1
        query = "DELETE FROM tbl_layout_placeholders where LayoutID =#{session[:layoutID]} and PlaceHolderID =#{params[:id]};"

        ActiveRecord::Base.connection.execute(query);
      end
    end

    #whenever delete button is pressed from PlaceHolder index page entry is deleted from Placeholder table as well
    #as from the bridge table

    if session[:placeholderdeleted] == 0

      query = "DELETE FROM tbl_layout_placeholders where LayoutID =#{session[:layoutID]} and PlaceHolderID =#{params[:id]};"

      ActiveRecord::Base.connection.execute(query);
      @tbl_place_holder.destroy

    end

    respond_to do |format|
      format.html { redirect_to tbl_place_holders_url, notice: 'Tbl place holder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_place_holder
      @tbl_place_holder = TblPlaceHolder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_place_holder_params
      params.require(:tbl_place_holder).permit(:PlaceHolderID, :PlaceHolderTitle, :PlaceHolderDesc, :IsActive,:Type)
    end

end
