# frozen_string_literal: true

class WorkGenre < ApplicationRecord
  has_many :works
  has_many :work_likes, through: :works

  validates :name, presence: true
  validates :position, presence: true, default: 0
  validates :color, presence: true, default: '#ffffff'
end
