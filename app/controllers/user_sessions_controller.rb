class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  #Creating user session
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_url, :notice => t('session.logged_in')
    else
      render :action => 'new'
    end
  end

  #Destroy user session
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to root_url, :notice => t('session.logged_out')
  end

end
