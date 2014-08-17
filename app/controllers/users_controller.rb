class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

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
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    # http://andowebsit.es/blog/noteslog.com/post/how-to-manage-users-in-rails-4-using-devise/
    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end


    if successfully_updated
      redirect_to users_path, notice: 'User was successfully updated.'
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
end
