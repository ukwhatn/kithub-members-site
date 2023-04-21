class WorkGenre < ApplicationRecord
  has_many :works
  has_many :work_likes, through: :works

  validates :name, presence: true
  validates :position, presence: true
  validates :color, presence: true
end
