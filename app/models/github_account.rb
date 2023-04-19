class GithubAccount < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :avatar_url, presence: true, format: { with: %r{\Ahttps?://[\S]+\z} }, allow_nil: true
end
