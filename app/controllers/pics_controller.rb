class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @pic = Pic.all
    if params[:query].present?
      @pics = Pic.search_full_text(params[:query]).order('created_at DESC')
    else
      @pics = Pic.all.order('created_at DESC')
    end
    @pic = Pic.new
  end

  def show
    @place = Pic.find(params[:id])
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = Pic.new(pic_params)
    @pic.user = User.first
    respond_to do |format|
      if @pic.save
        format.html { redirect_to root_path(@pic), notice: 'Pic was successfully posted'}
        format.json { render :show, status: :created, location: @pic }
        format.js
        # redirect_to pic_path(@pic)
      else
        format.html { render :new }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @pic.update(pic_params)
        flash[:success] = "Pics was successfully updated"
        format.html { redirect_to @pic, notice: "Pic was successfully updated"}
        format.json { render :show, status: :created, location: @pic }
        format.js
      else
        render 'edit'
      end
    end
  end

  def destroy
    @pic.destroy
    flash[:danger] = "Pics was successfully deleted"
    redirect_to pics_path
  end

  def upvote
    @pic.upvote_by current_user
    redirect_to :back
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :photo, :latitude, :longitude, :address1, :city, :state, :zipcode)
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
