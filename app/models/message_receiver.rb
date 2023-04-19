# frozen_string_literal: true

class MessageReceiver < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates :read, inclusion: { in: [true, false] }, presence: true, default: false
end
