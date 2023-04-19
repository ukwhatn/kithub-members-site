class User < ApplicationRecord
  has_one :discord_account, dependent: :destroy
  has_one :github_account, dependent: :destroy
  has_one :google_account, dependent: :destroy
  has_one :kindai_account, dependant: :destroy

  has_many :messages, foreign_key: :sender_id
  has_many :message_receivers
  has_many :received_messages, through: :message_receivers, source: :message

  has_many :project_members

  has_many :equipment_rentals
  has_many :entry_logs
end
