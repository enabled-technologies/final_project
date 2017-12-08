class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :category
      t.integer :prioriti
      t.datetime :duedate
      t.string :status
      t.integer :user_id

      t.timestamps

    end
  end
end
