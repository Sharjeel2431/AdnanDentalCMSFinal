class CmController < ApplicationController
  layout "lay_cms", except: [:processlogin]
  def cm

  end
  def index

    @indexs=Tblcm.all
  end
  def myaccount
    layout "lay_cms"
  end
  #####################################  LOGIN AUTHENTICATION ###################################################################

  def loginpage

  end

  def processlogin

    begin
          layout "lay_cms"
      user = TblCm.authenticate(params[:username], params[:password])

      if user   #check if the user is present in the db or not

        session[:user_id] = user.id
        session[:user_email]=user.email

        redirect_to :myaccount, :notice => "Logged in!"

      else


        flash.now.alert = "Invalid email or password"

        render "cm"

      end
    rescue

    end
  end

  def myaccount

    if session[:user_id] != nil

      @sessName = User.find(session[:user_id]).username
      @sessEmail = User.find(session[:user_id]).email

    else

      @sessName = "Guest"

    end

  end

  ###################################################################################################################
  def create
    params.permit!
    @user = User.new(params[:user])

    if @user.save
      # IssueMailer.issue_created(@user).deliver

      flash[:notice] = 'User Registered Successfully!'
      flash['color']= 'valid'
    else
      flash[:notice] = 'Form is invalid'
      flash[:color]= 'invalid'
    end

    render 'new'
  end

rescue




end
