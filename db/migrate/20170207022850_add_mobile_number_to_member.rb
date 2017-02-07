class AddMobileNumberToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :mobile_number, :string
    add_column :members, :unconfirmed_mobile_number, :string
    add_column :members, :mobile_confirmation_pin, :string
  end
end
