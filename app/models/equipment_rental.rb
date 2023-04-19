class EquipmentRental < ApplicationRecord
  belongs_to :equipment
  belongs_to :user

  validates :rental_start, presence: true, default: -> { Time.current }
  validates :rental_end, presence: false

  def returned?
    rental_end.present?
  end
end
