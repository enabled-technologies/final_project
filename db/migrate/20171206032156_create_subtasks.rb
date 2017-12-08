class CreateSubtasks < ActiveRecord::Migration[5.0]
  def change
    create_table :subtasks do |t|
      t.string :name
      t.integer :prioriti
      t.datetime :duedate
      t.string :status
      t.integer :task_id

      t.timestamps

    end
  end
end
