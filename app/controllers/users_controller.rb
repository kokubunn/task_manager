class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.turbo_stream { redirect_to users_path, notice: 'ユーザー情報が登録されました。' }
        format.html { redirect_to users_path, notice: 'ユーザー情報が登録されました。' }
      else
        format.turbo_stream { render :new, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    session[:user_id] = @user.id
    @user.update!(user_params)
    redirect_to @user, success: 'ユーザー情報が更新されました。'
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'ユーザーの更新に失敗しました.'
    render :edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, warning: 'ユーザー情報を削除しました。'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
