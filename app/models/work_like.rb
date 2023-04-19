# frozen_string_literal: true

class WorkLike < ApplicationRecord
  belongs_to :user
  belongs_to :work
end
