class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :room_title
      t.text :body
      t.string :thumbnail

      t.timestamps
    end
  end
end
