# frozen_string_literal: true

module SetAccount
  extend ActiveSupport::Concern

  included do
    before_action :set_account
  end

  private

  def set_account
    @account = Account.find(params[:account_id])
  end
end
