class ToursController < ApplicationController
  before_action :set_tour, only: %i[ show edit update destroy ]
  def index
    @tours = Tour.all
  end

  def show
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to @tour
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @tour.update(tour_params)
      redirect_to @tour
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tour.destroy
    redirect_to tours_path
  end

  private
  def set_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:name, :description, :duration, :price)
  end
end
