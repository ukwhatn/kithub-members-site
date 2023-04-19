class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, allow_blank: true
  validates :description_html, presence: true, allow_blank: true

  has_many :project_members
  has_many :members, through: :project_members, source: :user


end
