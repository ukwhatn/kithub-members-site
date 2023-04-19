class KindaiAccount < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :avatar_url, presence: true, format: { with: %r{\Ahttps?://\S+\z} }, allow_nil: true

  def create_from_omniauth(payload)
    obj = self.new
    obj.id = payload.uid
    obj.name = payload.info.first_name + ' ' + payload.info.last_name
    obj.email = payload.info.email
    obj.avatar_url = payload.info.image
    obj
  end

end
