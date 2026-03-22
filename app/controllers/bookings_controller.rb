class BookingsController < ApplicationController
skip_before_action :verify_authenticity_token
  def new
    @movie = Movie.find(params[:movie_id])
    @booking = Booking.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @booking = Booking.new(booking_params)
    @booking.movie = @movie

    if @booking.save
      redirect_to movie_path(@movie), notice: "Booking successful! Enjoy your movie! 🎬"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :email, :seats)
  end
end
