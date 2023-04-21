class GithubAccount < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :avatar_url, presence: true, format: { with: %r{\Ahttps?://\S+\z} }, allow_nil: true

  def set_value_from_omniauth(payload)
    self.id = payload.uid
    self.name = payload.info.name
    self.email = payload.info.email
    self.avatar_url = payload.info.image
    self
  end
end
