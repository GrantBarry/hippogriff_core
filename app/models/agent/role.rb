# frozen_string_literal: true

module Agent::Role
  extend ActiveSupport::Concern

  included do
    enum :role, %i[agent administrator account_manager], default: :agent
  end

  def can_administer?
    administrator?
  end

  def can_manage_account?
    account_manager? && Current.account == account
  end
end
