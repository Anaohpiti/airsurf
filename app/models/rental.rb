class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :board

  attribute :status, :string, default: 'pending'
end
