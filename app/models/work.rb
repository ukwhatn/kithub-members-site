class Work < ApplicationRecord
  belongs_to :user
  belongs_to :work_genre
  belongs_to :project, optional: true
  has_many :work_likes

  validates :name, presence: true

end
