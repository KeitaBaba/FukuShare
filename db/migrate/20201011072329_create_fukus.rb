class CreateFukus < ActiveRecord::Migration[6.0]
  def change
    create_table :fukus do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :image_id

      t.timestamps
    end
  end
end
