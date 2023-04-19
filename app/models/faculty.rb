class Faculty < ApplicationRecord
  has_many :departments

  validates :name, presence: true
end
