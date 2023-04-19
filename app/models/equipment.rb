# frozen_string_literal: true

class Equipment < ApplicationRecord
  has_many :equipment_rentals

  validates :name, presence: true
  validates :description, presence: true, allow_blank: true
  validates :description_html, presence: true, allow_blank: true

  def rented?
    equipment_rentals.where(rental_end: nil).exists?
  end
end
