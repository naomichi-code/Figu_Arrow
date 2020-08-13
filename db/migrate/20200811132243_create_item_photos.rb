class CreateItemPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :item_photos do |t|
      t.string :item_photo
      t.integer :post_id

      t.timestamps
    end
  end
end
