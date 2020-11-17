class Board < ApplicationRecord
  belongs_to :user
  has_many :rentals

  has_one_attached :photo
end
