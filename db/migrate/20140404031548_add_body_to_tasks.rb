class AddBodyToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :body, :Text
  end
end
