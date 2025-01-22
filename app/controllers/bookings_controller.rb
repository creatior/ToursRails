class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :get_clients_and_tours, only: %i[ new edit ]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      get_clients_and_tours
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def get_clients_and_tours
    @clients = Client.all
    @tours = Tour.all
  end

  def booking_params
    params.expect(booking: [ :client_id, :tour_id, :booking_date ])
  end
end
