# frozen_string_literal: true

# Provides basic email validation and normalization
# for models that have an email attribute.
module Emailable
  extend ActiveSupport::Concern

  included do
    normalizes :email, with: ->(value) { value.downcase.strip }
  end
end
