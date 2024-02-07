class Users::ProfilesController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email, :password, :profile, :profile_image))
      flash[:success] = "プロフィールの情報を更新しました"
      redirect_to users_profiles_show_path
    else
      render "edit"
    end
  end

end
