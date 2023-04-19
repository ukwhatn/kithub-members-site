class DiscordAccount < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :discriminator, presence: true, format: { with: /\A\d{4}\z/, message: 'の形式が異なります' }
  validates :avatar_url, presence: true, format: { with: %r{\Ahttps?://\S+\z} }, allow_nil: true

  def set_value_from_omniauth(payload)
    self.id = payload.uid
    self.name = payload.info.name
    self.discriminator = payload.extra.raw_info.discriminator
    self.avatar_url = payload.info.image
    self
  end
end
