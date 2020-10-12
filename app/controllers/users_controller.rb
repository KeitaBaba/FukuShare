class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users=User.all
  end

  def show
    @user=User.find_by(id:params[:id])
    @fukus=Fuku.where(user_id:@user.id)
    @likes=Like.where(user_id:@user.id)
  end
  

  def edit
    @user=User.find_by(id:params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       bypass_sign_in(@user)
       redirect_to user_path(@user)
       flash[:notice] = 'プロフィールを編集しました'
    else
      render action: :edit
    end
  end


private
def user_params
    params.require(:user).permit(:name, :email, :profile_image, :password)
end



end
