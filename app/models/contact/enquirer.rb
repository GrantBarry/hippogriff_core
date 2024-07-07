# frozen_string_literal: true

class Contact::Enquirer < Contact
  include Emailable

  has_person_name

  normalizes :first_name, :last_name, with: ->(value) { value.strip }
end
