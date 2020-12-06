class AddUserIdToBoards < ActiveRecord::Migration[6.0]
  def change
    # add_column :boards, :user_id, :integer
    add_reference :boards, :user
  end
end
