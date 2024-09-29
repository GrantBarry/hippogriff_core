# frozen_string_literal: true

class PropertyCommercialController < PropertiesController
  private

  def property_params
    params
      .require(:property_commercial)
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
        new_photos: [],
        new_files: []
      )
  end
end
