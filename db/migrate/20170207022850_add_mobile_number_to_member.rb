class AddMobileNumberToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :mobile_number, :string
  end
end
