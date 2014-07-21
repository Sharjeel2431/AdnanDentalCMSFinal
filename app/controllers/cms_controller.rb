class CmsController < ApplicationController
  layout "lay_cms" ,except: [:myaccount]

  def cm

  end
  def index


  end
  def logout
    session[:user_id] = nil
    redirect_to :cms , :notice => "Logged out!"
    if session[:user_id] == nil
      redirect_to :cms
    end
  end
  def myaccount

  end
  #####################################  LOGIN AUTHENTICATION ###################################################################

  def loginpage

  end

  def processlogin



      user = Cms.authenticate(params[:username], params[:password])

      if user  #check if the user is authenticated

        session[:user_id] = user.id
        session[:user_email]=user.email
        @status=""
        redirect_to :myaccount, :notice => "Logged in!"

      else


        flash.now.alert = "Invalid email or password"
        @status="Please Check Your Credentials!"
        render "index"

      end
  end

  def myaccount

    if session[:user_id] != nil

      @sessName = Cms.find(session[:user_id]).username
      @sessEmail = Cms.find(session[:user_id]).email

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
