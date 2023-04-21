class MessageReceiver < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates :read, inclusion: { in: [true, false] }, presence: true
end
