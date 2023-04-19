# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :skill_genre
  belongs_to :user
  has_many :user_skills
  has_many :users, through: :user_skills

  validates :name, presence: true
end
