class EventGuest < ApplicationRecord
  belongs_to :event_time_frame
  belongs_to :faculty
  belongs_to :department

  validates :name_first, presence: true
  validates :name_last, presence: true
  validates :name_last_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :name_first_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }

  validates :email, presence: true

  validates :student_id, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "は10桁の数字で入力してください" }
  validates :grade, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }

  validates :faculty_id, presence: true
  validates :department_id, presence: true
end
