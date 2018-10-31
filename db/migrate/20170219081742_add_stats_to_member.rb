class AddStatsToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :discussion_count, :integer, null: false, default: 0
    add_column :members, :comment_count, :integer, null: false, default: 0
    add_column :members, :last_active_at, :datetime
    add_column :members, :last_created_discussion_at, :datetime
    add_column :members, :last_created_comment_at, :datetime
  end
end
