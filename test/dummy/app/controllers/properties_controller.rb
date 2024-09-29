# frozen_string_literal: true

class PropertiesController < ApplicationController
  include SetAccount

  before_action :set_property, only: %i[show edit update destroy]

  def index
    @properties = @account.properties
  end

  def show
    @property = @account.properties.find(params[:id])
  end

  def new
    @property = @account.properties.build
  end

  def create
    @property = @account.properties.build(property_params)

    if @property.save
      redirect_to account_property_path(@property.account, @property), notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @property.photos.attach(property_params[:new_photos]) if property_params[:new_photos].present?
    @property.files.attach(property_params[:new_files]) if property_params[:new_files].present?
    if @property.update(property_params.except(:new_photos, :new_files))
      redirect_to account_property_path(@property.account, @property), notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @property.destroy
      redirect_to account_path(@property.account), notice: 'Property was successfully destroyed.'
    else
      redirect_to account_property_path(@property.account, @property), alert: 'Property could not be destroyed.'
    end
  end

  private

  def set_property
    @property = @account.properties.find(params[:id])
  end

  def property_params
    params
      .require(:property)
      .permit(
        :type,
        :agent_id,
        :internal_id,
        :name,
        :building,
        :estate,
        :floor_level,
        :floor,
        :unit_suite_shop,
        :local_council,
        :land_area_description,
        :hard_stand_yard_description,
        :headline,
        :grabline,
        :keywords,
        :parking_spaces,
        :parking_comments,
        :lifts_escalators_travelators,
        :clear_span_columns,
        :lot_number,
        :crane,
        :entrances_roller_doors_container_access,
        :zoning,
        :disability_access,
        :rating,
        :naming_rights,
        :naming_rights_cost_cents,
        :office_area,
        :warehouse_area,
        :showroom_area,
        :storage_area,
        :production_area,
        :trading_area,
        :floor_area,
        :land_area,
        :hard_stand_yard_area,
        :min_clearance_height,
        :max_clearance_height,
        :calculated_building_area,
        :share,
        :photos,
        :files,
        new_photos: [],
        new_files: []
      )
  end
end
