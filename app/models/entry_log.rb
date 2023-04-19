# frozen_string_literal: true

class EntryLog < ApplicationRecord
  belongs_to :user

  validates :entry_at, presence: true, default: -> { Time.current }
  validates :exit_at, presence: false

  def leave?
    !exit_at.nil?
  end
end
