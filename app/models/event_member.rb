class EventMember < ApplicationRecord
  belongs_to :user
  belongs_to :event_time_frame
end
