class EventTimeFrame < ApplicationRecord
  belongs_to :event
  has_many :event_members, dependent: :destroy
  has_many :event_guests, dependent: :destroy

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
