# frozen_string_literal: true

class CitiesController < ApplicationController
  include SetCountry
  include SetState
  before_action :set_city, only: %i[show edit update destroy]

  def index
    @cities = @state.cities.all.order(:name)
  end

  def show; end

  def new
    @city = @state.cities.new
  end

  def create
    @city = @state.cities.new(city_params)

    if @city.save
      redirect_to [@city.state.country, @city.state, @city]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @city.update(city_params)
      redirect_to [@city.state.country, @city.state, @city]
    else
      render :edit
    end
  end

  def destroy
    if @city.destroy
      redirect_to country_state_cities_path(@city.state.country, @city.state)
    else
      redirect_to [@city.state.country, @city.state, @city]
    end
  end

  private

  def city_params
    params.require(:city).permit(:name, :description)
  end

  def set_city
    @city = @state.cities.find(params[:id])
  end
end
