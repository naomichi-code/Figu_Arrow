class AddMasterIdToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :master_id, :integer
  end
end
