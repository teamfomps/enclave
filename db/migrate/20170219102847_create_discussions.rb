class CreateDiscussions < ActiveRecord::Migration[5.0]
  def change
    create_table :discussions do |t|
      t.references :category
      t.references :member
      t.string :name, null: false
      t.integer :comment_count, null: false, default: 0
      t.integer :first_comment_id
      t.boolean :is_active, null: false, default: true
      t.boolean :is_closed, null: false, default: false
      t.boolean :is_sticky, null: false, default: false
      t.timestamps
    end
  end
end
