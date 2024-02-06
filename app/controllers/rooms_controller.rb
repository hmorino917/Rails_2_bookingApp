class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = current_user.rooms
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = current_user.rooms.create(room_params)
    if @room.save
      redirect_to @room, notice: '部屋が作成されました'
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: '部屋情報が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    flash.now[:alert] = "予約が更新されました"
    redirect_to rooms_path
  end

  def search
    search_area = params[:area]
    search_keyword= params[:keyword]
    if search_area.present?
      @search_rooms = Room.where("address LIKE ?", "%#{search_area}%")
      @rooms_count = @search_rooms.count
    elsif search_keyword.present? 
      @search_rooms = Room.where("name LIKE ? OR information LIKE ?", "%#{search_keyword}%", "%#{search_keyword}%")
      @rooms_count = @search_rooms.count
    else
      flash.now[:notice] = "検索結果はありませんでした。"
    end

  end

  private

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :information, :price, :address, :room_image)
    end
  
end
