class User < ApplicationRecord
  # 必ずコントローラ内で確認すること
  # 既卒 => google, discord必須
  # 現役 => kindai, discord必須
  has_one :discord_account, dependent: :destroy
  has_one :github_account, dependent: :destroy
  has_one :google_account, dependent: :destroy
  has_one :kindai_account, dependent: :destroy

  belongs_to :faculty
  belongs_to :department

  has_many :messages, foreign_key: :sender_id
  has_many :message_receivers
  has_many :received_messages, through: :message_receivers, source: :message

  has_many :project_members

  has_many :equipment_rentals
  has_many :entry_logs

  validates :name_last, presence: true
  validates :name_first, presence: true
  validates :name_last_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :name_first_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }

  # 現役生のみのバリデーション
  with_options unless: :graduated? do
    validates :student_id, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "は10桁の数字で入力してください" }
    validates :faculty_id, presence: true
    validates :department_id, presence: true
  end

  validates :grade, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
  validates :phone_number, presence: true, format: { with: /\A\d{2,4}\d{2,4}\d{3,4}\z/, message: "は「08012345678」の形式で入力してください" }

  def graduated?
    self.grade == 0
  end

  def optimize
    if graduated?
      self.faculty_id = nil
      self.department_id = nil
      self.student_id = nil
    end
    self
  end

  def new
    self.optimize
    super
  end
end
