# frozen_string_literal: true

class Faculty < ApplicationRecord
  has_many :departments

  validates :name, presence: true
end
