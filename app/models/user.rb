class User < ApplicationRecord
  include SessionsHelper
  # 必ずコントローラ内で確認すること
  # 既卒 => google, discord必須
  # 現役 => kindai, discord必須
  has_one :discord_account, dependent: :destroy
  has_one :github_account, dependent: :destroy
  has_one :google_account, dependent: :destroy
  has_one :kindai_account, dependent: :destroy

  belongs_to :faculty, optional: true
  belongs_to :department, optional: true

  has_many :messages, foreign_key: :sender_id
  has_many :message_receivers
  has_many :received_messages, through: :message_receivers, source: :message

  has_many :project_members

  has_many :equipment_rentals
  has_many :entry_logs

  has_many :user_work_places
  has_many :work_places, through: :user_work_places

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
  validates :phone_number, presence: true, format: { with: /\A0\d{9,10}\z/, message: "は「08012345678」の形式で入力してください" }

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

  def full_name
    "#{self.name_last} #{self.name_first}"
  end

  def image_url(provider = nil)
    if provider.present?
      provider_class(provider).find_by(user_id: self.id).avatar_url
    else
      [self.google_account, self.kindai_account, self.discord_account].each do |account|
        return account.avatar_url if account.present?
      end
    end

    "noimage-sq.svg"
  end

  def department_str
    if graduated?
      "既卒"
    else
      "#{self.faculty.name} #{self.department.name}"
    end
  end

  def grade_str
    if graduated?
      "既卒"
    else
      "#{self.grade}年"
    end
  end

  def email
    self.graduated? ? self.google_account.email : self.kindai_account.email
  end

  def unread_messages
    self.message_receivers.where(read: false).map(&:message)
  end

  def update_work_places(work_place_str_list)
    # 更新後の勤務先をリスト化
    work_places = []
    work_place_str_list.each do |work_place_str|
      work_place = WorkPlace.find_by(name: work_place_str)
      if work_place.present?
        work_places << work_place
      else
        work_places << WorkPlace.create!(name: work_place_str)
      end
    end

    # 削除
    self.user_work_places.each do |user_work_place|
      user_work_place.destroy! unless work_places.include?(user_work_place.work_place)
    end

    # 追加
    work_places.each do |work_place|
      self.user_work_places.create!(work_place_id: work_place.id) unless self.work_places.include?(work_place)
    end

  end
end
