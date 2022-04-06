class Api::V1::HousesController < ApplicationController
  before_action :set_house, only: %i[show update destroy]

  def index
    @houses = House.all
    render json: @houses
  end

  def show
    return house_not_found unless @house

    render json: @house
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    return render json: @house.errors, status: :unprocessable_entity unless @house.save

    render json: @house, status: :created
  end

  def update
    return render json: @house.errors, status: :unprocessable_entity unless @house.update(house_params)
  end

  def destroy
    @house&.destroy
  end

  private

  def set_house
    @house = House.find_by(id: params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :price, :description, :country, :city, :address, :property_type, :image_url)
  end

  def house_not_found
    render json: { error: 'House not found' }, status: :not_found
  end
end
