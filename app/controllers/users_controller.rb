class UsersController < ApplicationController
  before_action :set_user, :except => [:index,:new,:create]
  def index
    @users = current_user if current_user.admin==false
    @users = User.where("admin=?",false)
  end
  

  def new
    @user = User.new
  end
 
 
  
  def create
    @user = User.new(user_params)
    @user.password = 'qawsed!@#'
    @user.password_confirmation = 'qawsed!@#'
    if @user.save
      @user.send_reset_password_instructions
      redirect_to  users_path
    else
      flash[:error] = "Failed to create user account"
      render "new"
    end
  end
 
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end
  
  def show
    
  end
  
  
  def update_block
    @user = User.find(params[:id])
    if current_user.is_active?
      @user.update(:is_active=>"false")
      redirect_to users_path, :notice => "user is banned"
    end 
  end
  
  def update_unblock
    @user = User.find(params[:id])
    if current_user.is_active?
      @user.update(:is_active=>"true")
      redirect_to users_path, :notice => "user is allowed"
    end 
  end
  

  def destroy
    if @user.destroy
      redirect_to users_path
    end
  end
  
  
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit!
  end

end

