# frozen_string_literal: true

class Contact::Business < Contact
  scope :visible_by, ->(agent) { where(share: true).or(Contact::Business.where(agent_id: agent.id)) }

  normalizes :company_name, :legal_name, :job_title, :email, :phone, :mobile, :fax, :url, :registration, with: ->(value) { value.strip }
  # Override any linked business (used for Individuals only)
  def business
    nil
  end

  def name=(val)
    self.company_name = val
  end

  def name
    company_name || ''
  end
end
