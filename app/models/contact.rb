class Contact < ApplicationRecord
  include Emailable

  belongs_to :account
  belongs_to :agent, optional: true
end
