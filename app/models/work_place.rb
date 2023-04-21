class WorkPlace < ApplicationRecord
  has_many :user_work_places
  has_many :users, through: :user_work_places
end
