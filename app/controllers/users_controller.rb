class UsersController < ApplicationController
  before_filter :store_location, :only=>[:edit] #Back to ref url
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:edit, :update]

  #TODO: email validation from email

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @current_user_session = UserSession.create(@user)
      redirect_to root_url, :notice=>t('user.flashes.register_done')
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to redirect_back_or_default(root_url), :notice=>t('user.flashes.register_done')
    else
      render :action => 'edit'
    end
  end



end
