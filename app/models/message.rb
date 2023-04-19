class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  has_many :message_receivers

  validates :subject, presence: true, allow_blank: true
  validates :body, presence: true, allow_blank: true
  validates :body_html, presence: true, allow_blank: true
end
