class GoogleAccount < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :avatar_url, presence: true, format: { with: %r{\Ahttps?://\S+\z} }, allow_nil: true

  def set_value_from_omniauth(payload)
    if payload.info.email.include?("kindai.ac.jp")
      return nil
    end

    self.id = payload.uid
    self.name = payload.info.first_name + ' ' + payload.info.last_name
    self.email = payload.info.email
    self.avatar_url = payload.info.image
    self
  end
end
