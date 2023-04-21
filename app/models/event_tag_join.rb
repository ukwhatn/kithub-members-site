class EventTagJoin < ApplicationRecord
  belongs_to :event
  belongs_to :event_tag
end
