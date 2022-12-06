class AddReferenceToDiscussions < ActiveRecord::Migration[7.0]
  def change
    add_reference :discussions, :category, null: false, foreign_key: true
  end
end
