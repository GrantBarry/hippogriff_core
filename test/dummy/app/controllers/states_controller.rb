# frozen_string_literal: true

class StatesController < ApplicationController
  before_action :set_country
  before_action :set_state, only: %i[show edit update destroy]

  def index
    @states = @country.states.all.order(:name)
  end

  def show
    @state = @country.states.find(params[:id])
  end

  def new
    @state = @country.states.new
  end

  def create
    @state = @country.states.new(state_params)

    if @state.save
      redirect_to [@state.country, @state]
    else
      render :new
    end
  end

  def edit
    @state = @country.states.find(params[:id])
  end

  def update
    if @state.update(state_params)
      redirect_to [@state.country, @state]
    else
      render :edit
    end
  end

  def destroy
    if @state.destroy
      redirect_to country_states_path(@country)
    else
      redirect_to [@state.country, @state]
    end
  end

  private

  def state_params
    params.require(:state).permit(:name, :abbreviation)
  end

  def set_state
    @state = @country.states.find(params[:id])
  end

  def set_country
    @country = Country.find(params[:country_id])
  end
end
