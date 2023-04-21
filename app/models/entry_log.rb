class EntryLog < ApplicationRecord
  belongs_to :user

  validates :entry_at, presence: true
  validates :exit_at, presence: false

  def leave?
    !exit_at.nil?
  end
end
