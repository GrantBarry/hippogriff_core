# frozen_string_literal: true

# Provides basic first and last name validation and normalization
# for models that have a first_name and last_name attributes.
module Nameable
  extend ActiveSupport::Concern

  included do
    validates :first_name, :last_name, presence: true
    normalizes :first_name, :last_name, with: ->(value) { value.strip }
  end
end
