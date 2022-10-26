# frozen_string_literal: true

# Using CurrentAttributes is a great way to prevent needing to pass current_user everywhere.
class Current < ActiveSupport::CurrentAttributes
  attribute :user
end
