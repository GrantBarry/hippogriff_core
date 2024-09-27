# frozen_string_literal: true

module SetCountry
  extend ActiveSupport::Concern

  included do
    before_action :set_country
  end

  private

  def set_country
    @country = Country.find(params[:country_id])
  end
end
