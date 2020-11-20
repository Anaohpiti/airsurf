class Board < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo

  validates :description, :location, :height, :brand, :volume, :price_per_day, :title, presence: true
  validates :volume, numericality:true
  validates :height, numericality:true
  validates :price_per_day, numericality:true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [ :location ],
    using: {
      tsearch: { prefix: true }
    }
  scope :by_brand, ->(brand) { where(brand: brand) }
end
