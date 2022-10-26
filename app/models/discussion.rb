# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  validates :name, presence: true

  enum status: { published: 0, pinned: 1, closed: 2 }
end
