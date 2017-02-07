class AddNotificationFlagsToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :receives_email_notifications, :boolean, null: false, default: false
    add_column :members, :receives_sms_notifications, :boolean, null: false, default: false
  end
end
