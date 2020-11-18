class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :board

  attribute :status, :string, default: 'pending'
  attribute :start_date, :date, default: 1
  attribute :end_date, :date, default: 1
end
