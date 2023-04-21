class UserWorkPlace < ApplicationRecord
  belongs_to :user
  belongs_to :work_place
end
