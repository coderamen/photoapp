class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = Pic.new(pic_params)
    @pic.user = User.first
    if @pic.save
      flash[:success] = "Pics was successfully posted"
      redirect_to pic_path(@pic)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      flash[:success] = "Pics was successfully updated"
      redirect_to @pic
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    flash[:danger] = "Pics was successfully deleted"
    redirect_to pics_path
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :photo)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

  def require_same_user
    if current_user != @pic.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own pics"
      redirect_to root_path
    end
  end
end
