class Contact < ApplicationRecord
  include Emailable

  belongs_to :agent
  belongs_to :account
end
