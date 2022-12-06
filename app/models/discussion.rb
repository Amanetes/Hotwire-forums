# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  belongs_to :category, counter_cache: true, touch: true

  validates :name, presence: true

  has_many :posts, dependent: :destroy

  accepts_nested_attributes_for :posts

  # https://github.com/hotwired/turbo-rails/blob/main/app/models/concerns/turbo/broadcastable.rb

  after_create_commit -> { broadcast_prepend_to 'discussions' }
  after_update_commit -> { broadcast_replace_to 'discussions' }
  after_destroy_commit -> { broadcast_remove_to 'discussions' }

  # We can use to_param on our models to get a more friendly URL, without needing a gem like FriendlyId
  def to_param
    "#{id}-#{name.downcase.to_s[0...100]}".parameterize
  end
end
