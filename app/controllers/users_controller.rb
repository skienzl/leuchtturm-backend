class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :check_admin_or_own_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    # users should not be able to change their role
    role = Integer(user_params[:role]) rescue nil
    if role.nil? || (role != @user.role && !current_user.is_admin?)
      admin_required
      return
    end

    # allow update without password
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
      redirect_to edit_user_path(@user), notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end

  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
    end

    def needs_password?(user, params)
      params[:password].present?
    end

    def check_admin_or_own_user
      if (@user.nil? || @user.id != current_user.id) && !current_user.is_admin?
        admin_required
      end
    end

    def admin_required
      redirect_to root_path, alert: 'Admin privileges required.'
    end

end
