class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.valid?
      calc_reservation_details
      render :confirm
    else
      render "/rooms/show"
    end

  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    if @reservation.save
      redirect_to reservations_path, success: "予約が確定しました"
    else
      render :confirm
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
  end

  def update
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
    if @reservation.update(reservation_params)
      calc_reservation_details
      binding.pry
      redirect_to reservations_path, success: "予約が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, success: "予約が削除されました"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guest_count, :sum_price, :user_id, :room_id)
  end

  def calc_reservation_details
    check_in_date = Date.parse(reservation_params[:check_in])
    check_out_date = Date.parse(reservation_params[:check_out])
    @stay_days = (check_out_date - check_in_date).to_i
    @guest_count = @reservation.guest_count
    @sum_price = @room.price * @stay_days * @guest_count
    @reservation.update_attribute(:sum_price, @sum_price)
  end

end
