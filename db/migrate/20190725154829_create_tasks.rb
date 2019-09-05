class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :task_completion,default: false
      t.string :name
      t.string :description
      t.timestamps null: false
      t.integer :user_id
    end
  end
end
