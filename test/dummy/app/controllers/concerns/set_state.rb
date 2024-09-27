# frozen_string_literal: true

module SetState
  extend ActiveSupport::Concern

  included do
    before_action :set_state
  end

  private

  def set_state
    @state = State.find(params[:state_id])
  end
end
