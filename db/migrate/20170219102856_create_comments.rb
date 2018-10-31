class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :discussion
      t.references :member
      t.text :body, null: false
      t.string :format
      t.boolean :is_deleted
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
