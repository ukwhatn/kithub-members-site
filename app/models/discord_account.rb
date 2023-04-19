class DiscordAccount < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :discriminator, presence: true, format: { with: /\A\d{4}\z/, message: 'の形式が異なります' }
  validates :avatar_url, presence: true, format: { with: %r{\Ahttps?://\S+\z} }, allow_nil: true
end
