class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_filter)
    if @user.save
      redirect_to users_path, notice: '新增成功'
    else
      render :new
    end
  end
  
  private

  def params_filter
    params.require(:user).permit(:name, :age, :email)
  end
end
