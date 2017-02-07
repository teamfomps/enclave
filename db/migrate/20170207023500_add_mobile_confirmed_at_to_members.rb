class AddMobileConfirmedAtToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :mobile_confirmed_at, :datetime
  end
end
