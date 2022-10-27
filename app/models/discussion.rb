# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  validates :name, presence: true

  # We can use to_param on our models to get a more friendly URL, without needing a gem like FriendlyId
  def to_param
    "#{id}-#{name.downcase.to_s[0...100]}".parameterize
  end
end
