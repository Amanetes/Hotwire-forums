# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :discussion, counter_cache: true, touch: true
  # автоматически назначит автором поста пользователя, который в настоящий момент залогинен
  belongs_to :user, default: -> { Current.user }

  has_rich_text :body
  has_noticed_notifications

  validates :body, presence: true

  after_create_commit -> { broadcast_append_to discussion, partial: 'discussions/posts/post', locals: { post: self } }
  after_update_commit -> { broadcast_replace_to discussion, partial: 'discussions/posts/post', locals: { post: self } }
  after_destroy_commit -> { broadcast_remove_to discussion }
end
