class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title_tag
      t.string :brand_tag
      t.string :chara_tag
      t.integer :post_id

      t.timestamps
    end
  end
end
