# frozen_string_literal: true

class PropertiesController < ApplicationController
  include SetAccount

  def index
    @properties = @account.properties
  end

  def show
    @property = @account.properties.find(params[:id])
  end

  def new
    @property = @account.properties.build
    @agents   = @account.agents
  end

  def create
    @property = @account.properties.build(property_params)
    @agents   = @account.agents

    if @property.save
      redirect_to @property, notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:name)
  end
end
