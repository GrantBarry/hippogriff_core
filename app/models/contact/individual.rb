# frozen_string_literal: true

class Contact::Individual < Contact
  belongs_to :business, optional: true

  scope :visible_by, ->(agent) { where(share: true).or(Contact::Individual.where(agent_id: agent.id)) }

  has_person_name

  normalizes :first_name, :last_name, with: ->(value) { value.strip }
end
