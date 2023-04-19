# frozen_string_literal: true

class User < ApplicationRecord
  has_many :discord_accounts
  has_many :github_accounts
  has_many :google_accounts

  has_many :messages, foreign_key: :sender_id
  has_many :message_receivers
  has_many :received_messages, through: :message_receivers, source: :message

  has_many :project_members

  has_many :equipment_rentals
  has_many :entry_logs
end
