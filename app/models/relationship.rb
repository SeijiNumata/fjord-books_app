# frozen_string_literal: true

class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'

  validates :user_id, presence: true, uniqueness: { scope: :follow_id }
  validates :follow_id, presence: true, uniqueness: { scope: :user_id }
end
