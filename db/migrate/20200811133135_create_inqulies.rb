class CreateInqulies < ActiveRecord::Migration[5.2]
  def change
    create_table :inqulies do |t|
      t.string :name, nill: false
      t.string :email, nill: false
      t.text :body, nill:false

      t.timestamps
    end
  end
end
