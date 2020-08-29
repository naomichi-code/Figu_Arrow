class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :room_title, nill: false
      t.text :body
      t.string :thumbnail_id

      t.timestamps
    end
  end
end
