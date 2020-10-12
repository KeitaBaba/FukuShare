class FukusController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  def index
    @fukus=Fuku.all
  end

  def show
    @fuku=Fuku.find_by(id:params[:id])
  end

  def new
    @fuku=Fuku.new
  end

  def create
    @fuku=Fuku.new(fuku_params)
    @fuku.user_id=current_user.id
    if @fuku.save
      flash[:notice] ="記事を投稿しました"
      redirect_to fukus_path
    else
      render action: :new
    end

  end

   def edit
    @fuku=Fuku.find_by(id:params[:id])
    if @fuku.user_id !=current_user.id
      redirect_to fukus_path, alert: "不正なアクセスです。"
    end
   end

  def update
    @fuku=Fuku.find_by(id:params[:id])
    if@fuku.update(fuku_params)
      flash[:notice]="レシピを編集しました"
      redirect_to fukus_path
    end
  end

  def destroy
    @fuku=Fuku.find_by(id:params[:id])
    @fuku.destroy
    redirect_to(fukus_path)
  end



  private
  def fuku_params
      params.require(:fuku).permit(:title, :body, :image)
  end

end
