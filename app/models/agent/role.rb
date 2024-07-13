# frozen_string_literal: true

module Agent::Role
  extend ActiveSupport::Concern

  included do
    enum :role, %i[agent administer account_manager], default: :agent
  end

  def can_administer?
    administrator?
  end

  def can_manage_account?
    account_manager? && Account.current == account
  end
end
