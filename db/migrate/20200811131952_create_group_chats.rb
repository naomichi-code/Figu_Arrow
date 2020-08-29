class CreateGroupChats < ActiveRecord::Migration[5.2]
  def change
    create_table :group_chats do |t|
      t.string :message
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
