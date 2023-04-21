class EventTag < ApplicationRecord
  has_many :event_tag_joins, dependent: :destroy
  has_many :events, through: :event_tag_joins

  validates :name, presence: true
end
