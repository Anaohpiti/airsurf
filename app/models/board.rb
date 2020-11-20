class Board < ApplicationRecord
  belongs_to :user
  has_many :rentals

  has_one_attached :photo

  validates :description, :location, :height, :brand, :volume, :price_per_day, :title, presence: true
  validates :volume, numericality:true
  validates :height, numericality:true
  validates :price_per_day, numericality:true

  def available?
    rentals.each do |rental|
      return false if Time.zone.today.between?(rental.start_date, rental.end_date)
    end
    return true
  end
end
